//
//  Tab.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//


import UIKit

// MARK: - HomeTab Tab
enum HomeTab: Int, CaseIterable {
    case nowPlaying = 0, popular, upcoming
    
    var title: String {
        return String(describing: self).l()
    }
    
    var image: UIImage? {
        switch self {
        case .nowPlaying:
            UIImage(systemName: "music.house")
        case .popular:
            UIImage(systemName: "flame")
        case .upcoming:
            UIImage(systemName: "square.stack.3d.down.right")
        }
    }
    
    var selectedImage: UIImage? {
        switch self {
        case .nowPlaying:
            UIImage(systemName: "music.house.fill")
        case .popular:
            UIImage(systemName: "flame.fill")
        case .upcoming:
            UIImage(systemName: "square.stack.3d.down.right.fill")
        }
    }
    
    var viewController: UIViewController {
        switch self {
        case .nowPlaying:
            return HomeController(homeTab: self)
        case .popular:
            return HomeController(homeTab: self)
        case .upcoming:
            return HomeController(homeTab: self)
        }
    }
}


// MARK: - AppTabBarController
public class AppTabBarController: UITabBarController {
    
    /// Edit for customization
    let barStyle: UIBarStyle = .black
    let barHeight: CGFloat = 74
    let selectedColor: UIColor = .appBarSelect
    let unselectedColor: UIColor = .appSubText
    
    let selectedFont: UIFont = .systemFont(ofSize: 14, weight: .medium)
    let unselectedFont: UIFont = .systemFont(ofSize: 12, weight: .regular)
    
    private var tabBarItems: [UIViewController] {
        var items: [UIViewController] = []
        
        HomeTab.allCases.forEach { tab in
            let tabBarItem =
            self.tabBarItem(for: RootRouter.createNavController(vc: tab.viewController,
                                                                title: tab.title,
                                                                image: tab.image!),
                            image: tab.image!,
                            selectedImage: tab.selectedImage!,
                            title: tab.title,
                            tag: tab.rawValue)
            
            items.append(tabBarItem)
        }
        return items
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setValue(AppTabBar(frame: tabBar.frame), forKey: "tabBar")
        viewControllers = tabBarItems
        tabBar.barStyle = barStyle
        
        configTabBarStyle()
    }
    
    
    private func removeTabBarItemBackground() {
        tabBar.backgroundColor = .appBlack
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
    }
    
    private func configTabBarStyle() {
        tabBar.unselectedItemTintColor = unselectedColor
        tabBar.tintColor = selectedColor
        
        UITabBarItem.appearance().setTitleTextAttributes([
            NSAttributedString.Key.font: unselectedFont
        ], for: .normal)
        
        UITabBarItem.appearance().setTitleTextAttributes([
            NSAttributedString.Key.font: selectedFont
        ], for: .selected)
    }
    
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var safeAreaBottomInset: CGFloat = 0.0
        
        if #available(iOS 11.0, *) {
            safeAreaBottomInset = view.safeAreaInsets.bottom
        }
        
        let newTabBarHeight: CGFloat = barHeight + safeAreaBottomInset
        var newFrame = tabBar.frame
        newFrame.size.height = newTabBarHeight
        newFrame.origin.y = view.frame.size.height - newTabBarHeight
        tabBar.frame = newFrame
    }
    
    private func tabBarItem(for controller: UIViewController,
                            image: UIImage,
                            selectedImage: UIImage,
                            title: String,
                            tag: Int) -> UIViewController {
        
        let item = UITabBarItem(title: title, image: image, tag: tag)
        
        item.imageInsets = UIEdgeInsets.zero
        item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 4)
        
        item.selectedImage = selectedImage
        
        controller.tabBarItem = item
        controller.hidesBottomBarWhenPushed = false
        return controller
    }
}
