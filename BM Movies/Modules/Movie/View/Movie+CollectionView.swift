//
//  Movie+TableView.swift
//  BM Movies
//
//  Created by Salah Khaled on 03/10/2024.
//


import UIKit

extension MovieController: UICollectionViewDelegateAndDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        genreCollectionView.initialize(cellClass: GenreCell.self, delegate: self, dataSource: self)
        genreCollectionView.enableAutomaticCellSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.getMovieDetail()?.genres?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeue(cellClass: GenreCell.self, indexPath: indexPath)
        let title = viewModel.getMovieDetail()?.genres?[indexPath.row].name ?? ""
        cell.configure(with: title)
        return cell
    }
    
}
