import XCTest
@testable import Deeplinking

final class DeeplinkRegistryTests: XCTestCase {
    fileprivate func makeDeeplink() -> Deeplink {
        return Deeplink(url: URL(string: "test://anyurl")!)
    }
    
    func test_registerCustomDeeplinkHandler() {
        let defaultHandler = MockDeeplinkHandler()
        
        let customHandler = MockDeeplinkHandler()
        customHandler.canHandle = true
        
        let sut = DeeplinkRegistry(defaultDeeplinkHandler: defaultHandler)
        sut.register(deeplinkHandler: customHandler)
        
        XCTAssertEqual(sut.deeplinkHandlers.count, 1)
        XCTAssertNotNil(sut.deeplinkHandlers[0] as? MockDeeplinkHandler)
    }
    
    func test_executeDefaultDeeplinkHandlerIfNoCustomHanderCanHandleDeeplink() {
        let defaultHandler = MockDeeplinkHandler()
        
        let customHandler = MockDeeplinkHandler()
        customHandler.canHandle = false
        
        let deeplink = makeDeeplink()
        let sut = DeeplinkRegistry(defaultDeeplinkHandler: defaultHandler)
        
        sut.register(deeplinkHandler: customHandler)
        sut.execute(url: deeplink.url)
        
        XCTAssertTrue(defaultHandler.handled)
        XCTAssertEqual(defaultHandler.handledDeeplink, deeplink)
        XCTAssertFalse(customHandler.handled)
        XCTAssertNil(customHandler.handledDeeplink)
    }
    
    func test_executeCustomDeeplinkHandlerIfCanHandleDeeplink() {
        let defaultHandler = MockDeeplinkHandler()
        
        let customHandler = MockDeeplinkHandler()
        customHandler.canHandle = true
        
        let deeplink = makeDeeplink()
        let sut = DeeplinkRegistry(defaultDeeplinkHandler: defaultHandler)
        
        sut.register(deeplinkHandler: customHandler)
        sut.execute(url: deeplink.url)
        
        XCTAssertTrue(customHandler.handled)
        XCTAssertEqual(customHandler.handledDeeplink, deeplink)
        XCTAssertFalse(defaultHandler.handled)
        XCTAssertNil(defaultHandler.handledDeeplink)
    }
    
    class MockDeeplinkHandler: DeeplinkHandler {
        var canHandle = false
        var canHandleDeeplink: Deeplink?
        
        var handled = false
        var handledDeeplink: Deeplink?
        
        func canHandle(url: Deeplink) -> Bool {
            canHandleDeeplink = url
            return canHandle
        }
        
        func handle(url: Deeplink) {
            handled = true
            handledDeeplink = url
        }
    }
}
