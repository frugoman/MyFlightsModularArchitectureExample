import UIKit

public protocol DeeplinkScreenFactory {
    func screen(forPath path: URL) -> UIViewController?
}
