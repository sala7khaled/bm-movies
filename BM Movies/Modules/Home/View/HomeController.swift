//
//  HomeController.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import UIKit

class HomeController: BaseController {

    // MARK: - Outlets
    @IBOutlet weak var movieTableView: UITableView!
    
    // MARK: - Properties
    let viewModel: HomeViewModel
    
    // MARK: - Init
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupViewModel()
    }
    
    // MARK: - Methods
    func setupViewModel() {
        viewModel.getMoviesAPI()
        
        loading?.show()
        
        viewModel.didFailedMoviesClosure = { [weak self] errorMessage in
            guard let self else { return }
            self.loading?.close()
            showError(message: errorMessage)
        }
        
        viewModel.didSuccessMoviesClosure = { [weak self] in
            guard let self else { return }
            self.loading?.close()
            self.movieTableView.reloadData()
        }
        
    }


}
