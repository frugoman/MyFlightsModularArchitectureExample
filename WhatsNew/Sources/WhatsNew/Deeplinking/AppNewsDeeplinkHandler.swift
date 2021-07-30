import MyFlightsDeeplinking
import UIKit

public class AppNewsDeeplinkHandler: DeeplinkHandler {
    private let rootViewController: UIViewController
    private let deeplinkRegistry: DeeplinkRegistry
    
    public init(deeplinkRegistry: DeeplinkRegistry, rootViewController: UIViewController){
        self.rootViewController = rootViewController
        self.deeplinkRegistry = deeplinkRegistry
    }
    
    public func canHandle(url: Deeplink) -> Bool {
        url.pathIs("/whats_new")
    }
    
    public func handle(url: Deeplink) {
        let title = url.queryItem("title")!
        let message = url.queryItem("message")!
        let actionDeeplink = url.queryItem("action")
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in alert.dismiss(animated: true, completion: nil) }))
        if let actionLink = actionDeeplink {
            alert.addAction(UIAlertAction(title: "Go!", style: .default, handler: { [weak self] _ in alert.dismiss(animated: true, completion: nil)
                self?.deeplinkRegistry.execute(url: .orDefaultDeeplink(actionLink))
            }))
        }
        
        rootViewController.present(alert, animated: true, completion: nil)
    }
}
