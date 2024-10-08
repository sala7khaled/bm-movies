//
//  Movie+TableView.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import UIKit

extension HomeController: UITableViewDelegateAndDataSource {
    
    func setupTableView() {
        movieTableView.initialize(cellClass: MovieCell.self, delegate: self, dataSource: self,
                                  estimatedRowHeight: 190,
                                  edgeInsets: UIEdgeInsets(top: 24, left: 0, bottom: 40, right: 0))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getMovieCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: MovieCell.self)
        let movie = viewModel.getMovieAt(index: indexPath.row)
        cell.configure(with: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let movieId = viewModel.getMovieAt(index: indexPath.row).id else { return }
        
        let viewModel = MovieViewModel(movieId: movieId)
        let vc = MovieController(viewModel: viewModel)
        
        RootRouter.pushVC(vc, in: self, animated: true)
    }
    
}
