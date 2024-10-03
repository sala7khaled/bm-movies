//
//  GenreCell.swift
//  BM Movies
//
//  Created by Salah Khaled on 03/10/2024.
//

import UIKit

class GenreCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Methods
    func configure(with title: String) {
        titleLabel.text = title
    }

}
