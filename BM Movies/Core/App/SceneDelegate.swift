//
//  SceneDelegate.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import UIKit
import SystemConfiguration

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var reachabilityManager = ReachabilityManager()
    var reachabilityBanner = ReachabilityBanner()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        reachabilityManager.start(listener: self)
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.tintColor = .appPrimary
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        
        let vc = SplashController()
        window?.rootViewController = vc
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene)  { }


}

// MARK: - Extensions
extension SceneDelegate: ReachabilityManagerListener {
    
    func notifyChange(with flags: SCNetworkReachabilityFlags) {
        reachabilityBanner.notifyStatusBar(in: window, for: flags)
    }
}
