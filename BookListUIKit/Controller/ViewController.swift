import UIKit

final class ViewController: UIViewController {
    // MARK: Private
    // MARK: - Outlets
    private let tableView = UITableView()
    // MARK: Private
    // MARK: - Properties
    private let dataSource: [BookModel] = [BookModel(bookName: "Harry Potter and Phoenix order",
                                                     bookImage: UIImage(imageLiteralResourceName: "harrypotter1"),
                                                     price: 18.99,
                                                     author: "Joanne Rowling"),
                                           BookModel(bookName: "Deniskin's stories",
                                                     bookImage: UIImage(imageLiteralResourceName: "deniska"),
                                                     price: 12.99,
                                                     author: "Viktor Dragunksiy"),
                                           BookModel(bookName: "Harry Potter and Prince half blood",
                                                     bookImage: UIImage(imageLiteralResourceName: "harry6"),
                                                     price: 20.99,
                                                     author: "Joanne Rowling"),
                                           BookModel(bookName: "Spartak",
                                                     bookImage: UIImage(imageLiteralResourceName: "spartak"),
                                                     price: 15.99,
                                                     author: "Rafaello Jovaniolli"),
                                           BookModel(bookName: "Iliada",
                                                     bookImage: UIImage(imageLiteralResourceName: "homer"),
                                                     price: 10.99,
                                                     author: "Homer"),
                                           BookModel(bookName: "Robinzon Cruzo",
                                                     bookImage: UIImage(imageLiteralResourceName: "robinzoncruzo"),
                                                     price: 14.99,
                                                     author: "Daniel Defo"),
                                           BookModel(bookName: "Karlsson",
                                                     bookImage: UIImage(imageLiteralResourceName: "carlson"),
                                                     price: 11.99,
                                                     author: "Astrid Lindrgen")]
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        setupTableView()
        setupUI()
    }
    // MARK: Private
    // MARK: - Setups
    private func addSubviews() {
        view.addSubview(tableView)
    }
    private func setupUI() {
        title = "Book list"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 150
        tableView.separatorStyle = .singleLine
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
    }
    //MARK: Constraints
    private func addConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
//MARK: TableViewDelegate, TableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell {
            cell.setInfo(params: dataSource[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailScreenVC = BookInfoController()
        detailScreenVC.setInfo(params: dataSource[indexPath.row])
        navigationController?.pushViewController(detailScreenVC, animated: true)
    }
}
