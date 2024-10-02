//
//  SplashController.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import UIKit

class SplashController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        presentHome()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        loadingIndicator.stopAnimating()
    }
    
    // MARK: - Methods
    func setupUI() {
        loadingIndicator.startAnimating()
    }
    
    func presentHome() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            RootRouter.presentRootTab()
        }
    }

}
