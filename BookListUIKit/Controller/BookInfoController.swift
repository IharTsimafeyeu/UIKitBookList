import UIKit

final class BookInfoController: UIViewController {
   
    // MARK: Private
    // MARK: - Outlets
    private let bookPosterImage = UIImageView()
    private let bookDescription = UITextView()
    private let tagsStackView = UIStackView()
    private let authorNameLabel = UILabel()
    private let bookNameLabel = UILabel()
    private let posterContainerView = UIView()
    private let bookTagsLeadingLabel = UILabel()
    private let bookTagsCenterLabel = UILabel()
    private let bookTagsTrailingLabel = UILabel()
    private let buyButton = UIButton()
    private let lineCustomView = LineWithBezierCurv()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        setupUI()
    }
    // MARK: Private
    // MARK: - Setups
    private func addSubviews() {
        view.addSubviews(authorNameLabel,
                         bookNameLabel,
                         bookDescription,
                         tagsStackView,
                         lineCustomView,
                         buyButton,
                         posterContainerView
        )
        tagsStackView.addArrangedSubviews(bookTagsLeadingLabel,
                                          bookTagsCenterLabel,
                                          bookTagsTrailingLabel
        )
        posterContainerView.addSubview(bookPosterImage)
    }
    //MARK: Constraints
    private func addConstraints() {
        posterContainerView.translatesAutoresizingMaskIntoConstraints = false
        posterContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        posterContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        posterContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/7).isActive = true
        posterContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3/7).isActive = true
        
        authorNameLabel.translatesAutoresizingMaskIntoConstraints = false
        authorNameLabel.centerXAnchor.constraint(equalTo: bookPosterImage.centerXAnchor).isActive = true
        authorNameLabel.topAnchor.constraint(equalTo: bookPosterImage.bottomAnchor, constant: 30).isActive = true
        
        bookNameLabel.translatesAutoresizingMaskIntoConstraints = false
        bookNameLabel.topAnchor.constraint(equalTo: authorNameLabel.bottomAnchor).isActive = true
        bookNameLabel.centerXAnchor.constraint(equalTo: authorNameLabel.centerXAnchor).isActive = true
        bookNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bookNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        bookDescription.translatesAutoresizingMaskIntoConstraints = false
        bookDescription.topAnchor.constraint(equalTo: bookNameLabel.bottomAnchor, constant: 20).isActive = true
        bookDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        bookDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        bookDescription.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12).isActive = true
        
        tagsStackView.translatesAutoresizingMaskIntoConstraints = false
        tagsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        tagsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        tagsStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        tagsStackView.topAnchor.constraint(equalTo: bookDescription.bottomAnchor, constant: 25).isActive = true
        
        lineCustomView.translatesAutoresizingMaskIntoConstraints = false
        lineCustomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        lineCustomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        lineCustomView.topAnchor.constraint(equalTo: tagsStackView.bottomAnchor, constant: 15).isActive = true
        lineCustomView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buyButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 5/9).isActive = true
        buyButton.topAnchor.constraint(equalTo: lineCustomView.bottomAnchor, constant: 15).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        bookPosterImage.translatesAutoresizingMaskIntoConstraints = false
        bookPosterImage.topAnchor.constraint(equalTo: posterContainerView.topAnchor).isActive = true
        bookPosterImage.bottomAnchor.constraint(equalTo: posterContainerView.bottomAnchor).isActive = true
        bookPosterImage.leadingAnchor.constraint(equalTo: posterContainerView.leadingAnchor).isActive = true
        bookPosterImage.trailingAnchor.constraint(equalTo: posterContainerView.trailingAnchor).isActive = true
        
        bookTagsLeadingLabel.translatesAutoresizingMaskIntoConstraints = false
        bookTagsCenterLabel.translatesAutoresizingMaskIntoConstraints = false
        bookTagsTrailingLabel.translatesAutoresizingMaskIntoConstraints = false
        bookTagsCenterLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        bookTagsLeadingLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        bookTagsTrailingLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    //MARK: UI
    private func setupUI() {
        view.backgroundColor = .white
        setupUIForPosterImage()
        setupUIForAuthorLabel()
        setupUIForNameLabel()
        setupUIDescription()
        setupUIForStackView()
        setupUIForTagLabels()
        setupUIForButton()
        setupNavigationBar()
        setupUIForLineView()
    }
    private func setupUIForStackView() {
        tagsStackView.axis = .horizontal
        tagsStackView.alignment = .center
        tagsStackView.distribution = .fillEqually
        tagsStackView.setCustomSpacing(20, after: bookTagsLeadingLabel)
        tagsStackView.setCustomSpacing(20, after: bookTagsCenterLabel)
    }
    private func setupUIForPosterImage() {
        posterContainerView.layer.cornerRadius = 7
        posterContainerView.addShadow()
        bookPosterImage.layer.cornerRadius = 7
        bookPosterImage.layer.masksToBounds = true
    }
    private func setupUIForAuthorLabel() {
        authorNameLabel.textColor = .gray
        authorNameLabel.font = .systemFont(ofSize: 16)
    }
    private func setupUIForNameLabel() {
        bookNameLabel.textColor = .black
        bookNameLabel.font = .systemFont(ofSize: 30, weight: .bold)
        bookNameLabel.textAlignment = .center
        bookNameLabel.numberOfLines = 2
    }
    private func setupUIDescription() {
        bookDescription.textColor = .gray
        bookDescription.font = .systemFont(ofSize: 17)
        bookDescription.text = "In Pages on iPad, add a border, such as a solid or dotted line, around a page. To change the transparency, drag the Opacity slider at the bottom of the controls. To lock the border so it doesn't get moved accidentally, tap Arrange (at the top of the controls), then tap See alsoAdd a border to an object in Pages on iPad."
    }
    private func setupUIForTagLabels() {
        bookTagsLeadingLabel.text = "Rasskazi"
        bookTagsCenterLabel.text = "Pro"
        bookTagsTrailingLabel.text = "Denisku"
        
        bookTagsLeadingLabel.textAlignment = .center
        bookTagsCenterLabel.textAlignment = .center
        bookTagsTrailingLabel.textAlignment = .center
        
        bookTagsCenterLabel.layer.borderWidth = 1
        bookTagsLeadingLabel.layer.borderWidth = 1
        bookTagsTrailingLabel.layer.borderWidth = 1
        
        bookTagsLeadingLabel.font = .systemFont(ofSize: 19, weight: .bold)
        bookTagsCenterLabel.font = .systemFont(ofSize: 19, weight: .bold)
        bookTagsTrailingLabel.font = .systemFont(ofSize: 19, weight: .bold)
        
        bookTagsLeadingLabel.layer.borderColor = UIColor.gray.cgColor
        bookTagsCenterLabel.layer.borderColor = UIColor.gray.cgColor
        bookTagsTrailingLabel.layer.borderColor = UIColor.gray.cgColor
        
        bookTagsCenterLabel.layer.cornerRadius = 20
        bookTagsTrailingLabel.layer.cornerRadius = 20
        bookTagsLeadingLabel.layer.cornerRadius = 20
    }
    private func setupUIForButton() {
        buyButton.backgroundColor = .black
        buyButton.layer.cornerRadius = 20
    }
    private func setupUIForLineView() {
        lineCustomView.backgroundColor = .white
    }
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bag.fill.badge.plus"), style: .plain, target: self, action: #selector(addToFavoritesBarButton))
    }
    //MARK: Private
    //MARK: - API
    func setInfo(params: BookModel) {
        bookPosterImage.image = params.bookImage
        authorNameLabel.text = params.author
        buyButton.setTitle("\(params.price)$", for: .normal)
        bookNameLabel.text = params.bookName
    }
    //MARK: Private
    //MARK: - Actions
    @objc private func addToFavoritesBarButton() {
    }
}
