import UIKit

class AnimesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AnimeCell()
        let anime = animes[indexPath.row]
        cell.configure(anime: anime)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name:"Detail",bundle: Bundle(for: DetailViewController.self))
        let detailViewController = storyBoard.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        detailViewController.anime = animes[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    private var  animes:[Anime] = [
        
    ]
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .systemYellow
        label.numberOfLines = 0
        label.text = "Animes Populares"
        return label
    }()
    private let tableView:UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .darkGray
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        
        return tableView
    }()
    private var id = [Anime]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        tableView.dataSource = self
        tableView.delegate = self
        addViewsToHierarchy()
        setupConstraints()
        loadData()
        
    }
    
    private func addViewsToHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
        ])
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func loadData(){
        
        let headers = [
            "X-RapidAPI-Key": "2b5160ae31msh703f78c619e3a95p103008jsnf3ba136faf98",
            "X-RapidAPI-Host": "anime-db.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://anime-db.p.rapidapi.com/anime?page=1&size=10&search=Fullmetal&genres=Fantasy%2CDrama&sortBy=ranking&sortOrder=asc")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        request.httpBody = NSJSONSerialization.dataWithJSONObject(params,options: <#T##JSONSerialization.WritingOptions#>)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
            guard let animeData = data else {return}
            print(String(data: animeData, encoding: .utf8))
            
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
    })
    dataTask.resume()
    }
}

