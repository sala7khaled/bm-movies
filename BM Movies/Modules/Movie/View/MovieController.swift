//
//  MovieController.swift
//  BM Movies
//
//  Created by Salah Khaled on 03/10/2024.
//

import UIKit

class MovieController: BaseController {

    // MARK: - Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var adultDot: UIView!
    @IBOutlet weak var adultLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var websiteButton: AppButton!
    @IBOutlet weak var storylineTitle: UILabel!
    @IBOutlet weak var storylineLabel: UILabel!
    @IBOutlet weak var votingTitle: UILabel!
    @IBOutlet weak var votingLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var genreCollectionView: UICollectionView!
    
    
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
        
        setupUI()
        setupCollectionView()
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Methods
    func setupUI() {
        scrollView.isHidden = true
        posterImage.layer.cornerRadius = 12
        
        // Localizations
        websiteButton.setTitle("visit_website")
        storylineTitle.text = "storyline".l()
        votingTitle.text = "voting".l()
        genresLabel.text = "genres".l()
    }
    
    func setupViewModel() {
        viewModel.getMovieDetailAPI()
        
        loading?.show()
        
        viewModel.didFailedDetailClosure = { [weak self] errorMessage in
            guard let self else { return }
            self.loading?.close()
            showError(message: errorMessage)
        }
        
        viewModel.didSuccessDetailClosure = { [weak self] in
            guard let self else { return }
            self.loading?.close()
            self.setupMovieDetail()
        }
        
    }
    
    func setupMovieDetail() {
        guard let movie = viewModel.getMovieDetail() else {
            AlertController.shared.show(in: self, message: "Movie details not found!" ) { action in
                self.navigationController?.popViewController(animated: true)
            }
            return
        }
        
        scrollView.isHidden = false
        bannerImage.loadImage(path: movie.backdropPath)
        posterImage.loadImage(path: movie.posterPath)
        
        titleLabel.text = movie.title
        taglineLabel.text = movie.tagline
        languageLabel.text = movie.originalLanguage?.capitalized
        
        adultLabel.isHidden = !(movie.adult ?? false)
        adultDot.isHidden = !(movie.adult ?? false)
        
        statusLabel.text = movie.status
        dateLabel.text = movie.releaseDate
        
        storylineLabel.text = movie.overview
        
        let average = String(format: "%.1f", movie.voteAverage ?? "0")
        votingLabel.text = average
        
        if let count = movie.voteCount {
            countLabel.text = "(\(count))"
        }
        
        genreCollectionView.reloadData()
        
    }
    
    // MARK: - Actions
    @IBAction func websiteButtonClicked(_ sender: Any) {
        
        guard let movie = viewModel.getMovieDetail(), let url = URL(string: movie.homepage ?? "") else {
            showError(message: "link_error".l())
            return
        }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            showError(message: "link_error".l())
        }
    }
    
    
}
