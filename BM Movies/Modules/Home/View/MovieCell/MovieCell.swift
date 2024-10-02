//
//  MovieCell.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import UIKit

class MovieCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var adultView: UIView!
    
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        posterImage.layer.cornerRadius = 14
        adultView.layer.cornerRadius = 6
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 24, bottom: 10, right: 24))
    }

    // MARK: - Methods
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with movie: MovieModel) {
        
        posterImage.loadImage(url: movie.backdropPath)
        
        
        titleLabel.text = movie.originalTitle
        languageLabel.text = movie.originalLanguage?.capitalized
        dateLabel.text = movie.releaseDate
        
        let average = String(format: "%.1f", movie.voteAverage ?? "0")
        averageLabel.text = "\(average)/10"
        
        if let count = movie.voteCount {
            countLabel.text = "(\(count))"
        }
        
        
        adultView.isHidden = !(movie.adult ?? false)
    }
    
}
