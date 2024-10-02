//
//  HomeController.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import UIKit

class HomeController: BaseController {

    // MARK: - Outlets
    
    // MARK: - Properties
    let viewModel = HomeViewModel()
    var homeTab: HomeTab
    
    // MARK: - Init
    init(homeTab: HomeTab) {
        self.homeTab = homeTab
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
    }
    
    // MARK: - Methods
    func setupViewModel() {
        viewModel.getMoviesAPI()
        
        viewModel.didFailedMoviesClosure = { [weak self] errorMessage in
            guard let self else { return }
            AlertController.shared.show(in: self, message: errorMessage)
        }
        
        viewModel.didSuccessMoviesClosure = { [weak self] in
            guard let self else { return }
            print(viewModel.getMovieAt(index: 1).id)
        }
    }
    
    // MARK: - Actions


}
