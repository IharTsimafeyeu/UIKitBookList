import UIKit

final class TableViewCell: UITableViewCell {
    // MARK: Public
    // MARK: - Properties
    static let identifier = "TableViewCell"
    // MARK: Private
    // MARK: - Outlets
    private let mainView = UIView()
    private let stackView = UIStackView()
    private let bookNameLabel = UILabel()
    private let authorLabel = UILabel()
    private let priceLabel = UILabel()
    private let containerForImageView = UIView()
    private let bookTitleImage = UIImageView()
    // MARK: Private
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        addContstrainst()
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Private
    // MARK: - Setups
    private func addSubviews() {
        contentView.addSubview(mainView)
        mainView.addSubviews(containerForImageView,
                             stackView
        )
        stackView.addArrangedSubviews(bookNameLabel,
                                      authorLabel,
                                      priceLabel
        )
        containerForImageView.addSubview(bookTitleImage)
    }
    //MARK: Constraints
    private func addContstrainst() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        containerForImageView.translatesAutoresizingMaskIntoConstraints = false
        containerForImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10).isActive = true
        containerForImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 30).isActive = true
        containerForImageView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -15).isActive = true
        containerForImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15).isActive = true
        stackView.leadingAnchor.constraint(equalTo: containerForImageView.trailingAnchor, constant: 30).isActive = true
        stackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20).isActive = true

        bookTitleImage.translatesAutoresizingMaskIntoConstraints = false
        bookTitleImage.topAnchor.constraint(equalTo: containerForImageView.topAnchor).isActive = true
        bookTitleImage.bottomAnchor.constraint(equalTo: containerForImageView.bottomAnchor).isActive = true
        bookTitleImage.leadingAnchor.constraint(equalTo: containerForImageView.leadingAnchor).isActive = true
        bookTitleImage.trailingAnchor.constraint(equalTo: containerForImageView.trailingAnchor).isActive = true
    }
    //MARK: UI
    private func setupUI() {
        setupTitleImageUI()
        setupLabels()
        setupStackViewUI()
    }
    private func setupStackViewUI() {
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing

    }
    private func setupTitleImageUI() {
        containerForImageView.layer.cornerRadius = 7
        containerForImageView.addShadow()
        bookTitleImage.layer.cornerRadius = 7
        bookTitleImage.layer.masksToBounds = true
    }
    private func setupLabels() {
        bookNameLabel.textAlignment = .left
        bookNameLabel.textColor = .black
        bookNameLabel.font = .systemFont(ofSize: 21, weight: .bold)
        bookNameLabel.numberOfLines = 0
        
        authorLabel.textAlignment = .left
        authorLabel.textColor = .systemGray3
        authorLabel.font = .systemFont(ofSize: 15, weight: .medium)
        
        priceLabel.textAlignment = .left
        priceLabel.textColor = .black
        priceLabel.font = .systemFont(ofSize: 25, weight: .medium)
    }
    //MARK: Public
    //MARK: - API
    func setInfo(params: BookModel) {
        bookNameLabel.text = params.bookName
        bookTitleImage.image = params.bookImage
        authorLabel.text = "by: \(params.author)"
        priceLabel.text = "$\(params.price)"
    }
}
