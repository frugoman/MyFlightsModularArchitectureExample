//
//  SceneDelegate.swift
//  MyFlights
//
//  Created by Nicolas Frugoni on 08/07/2021.
//

import UIKit
import FlightsSearchPresentation
import MyFlightsSearchEngine

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    private let initialVCFactory = InitialControllerFactory()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: scene)
        
        window.rootViewController = initialVCFactory.makeInitialController()
        self.window = window
        window.makeKeyAndVisible()
    }
}
