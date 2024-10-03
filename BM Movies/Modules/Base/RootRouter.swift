//
//  RootRouter.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import UIKit

class RootRouter {
    
    static func pushVC(_ vc: UIViewController, in viewController: UIViewController, animated: Bool = true) {
        viewController.navigationController?.pushViewController(vc, animated: animated)
    }
    
    static func presentRootNav(with vc: UIViewController) {
        let nav = AppNavController(rootViewController: vc)
        presentRoot(nav)
    }
    
    static func presentRootTab() {
        presentRoot(AppTabBarController())
    }
    
    static func presentRootScreen(in window: UIWindow?, vc: UIViewController) {
        window?.makeKeyAndVisible()
        window?.rootViewController = vc
    }
    
    static func presentRoot(_ vc: UIViewController) {
        let window = UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
        window?.makeKeyAndVisible()
        window?.rootViewController = vc
    }
    
    static func createNavController(vc: UIViewController, title: String, image: String) -> UINavigationController {
        vc.navigationItem.title = title
        let nav = AppNavController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = UIImage(systemName: image)
        return nav
    }
    
    static func resetApp() {
        let vc = SplashController()
        resetApp(with: vc)
    }
    
    static func resetApp(with vc: UIViewController) {
        let window = UIApplication.shared.connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .map({$0 as? UIWindowScene})
            .compactMap({ $0 })
            .first?.windows
            .filter({ $0.isKeyWindow }).first
        
        window?.makeKeyAndVisible()
        window?.rootViewController = vc
    }
}
