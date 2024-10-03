//
//  MovieController.swift
//  BM Movies
//
//  Created by Salah Khaled on 03/10/2024.
//

import UIKit

class MovieController: BaseController {

    // MARK: - Outlets
    
    
    // MARK: - Properties
    let viewModel: MovieViewModel
    
    // MARK: - Init
    init(viewModel: MovieViewModel) {
        self.viewModel = viewModel
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
        viewModel.getMovieDetailAPI()
        
        loading?.show()
        
        viewModel.didFailedDetailClosure = { [weak self] errorMessage in
            guard let self else { return }
            self.loading?.close()
            AlertController.shared.show(in: self, message: errorMessage)
        }
        
        viewModel.didSuccessDetailClosure = { [weak self] in
            guard let self else { return }
            self.loading?.close()
//            self.movieTableView.reloadData()
        }
        
    }
    
    
}
