//
//  BaseController.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import UIKit

public class BaseController: UIViewController {
    
    var loading: LoadingController?
    var uiRefreshControl = UIRefreshControl()
        
    public override func viewDidLoad() {
        super.viewDidLoad()
        loading = LoadingController()
        
    }
    
    public func getQueryParameter(url: String, param: String) -> String? {
        guard let url = URLComponents(string: url) else { return nil }
        return url.queryItems?.first(where: { $0.name == param })?.value
    }
}

// MARK: Refresher

extension BaseController {
    
    func addRefresher(_ tableView: UITableView, _ color: UIColor? = .gray) {
        uiRefreshControl.tintColor = color
        tableView.refreshControl = uiRefreshControl
    }
    
    func endRefresher() {
        if uiRefreshControl.isRefreshing {
            uiRefreshControl.endRefreshing()
        }
    }
}

extension BaseController {
    
    /// Show Loading View over Full Screen
    ///
    func showLoading() {
        DispatchQueue.main.async {
            self.loading?.show()
        }
    }

    /// Hide Loading View
    ///
    func hideLoading() {
        DispatchQueue.main.async {
            self.loading?.close()
        }
    }
    
}
