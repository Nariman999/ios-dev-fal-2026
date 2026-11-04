import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let sports: [FavoriteItem] = [
        FavoriteItem(title: "Karate", subtitle: "Japanese martial art", imageName: "figure.karate", rating: 5),
        FavoriteItem(title: "Football", subtitle: "World's most popular team sport", imageName: "figure.soccer", rating: 5),
        FavoriteItem(title: "Swimming", subtitle: "Refreshing water sport", imageName: "figure.pool.swim", rating: 5),
        FavoriteItem(title: "Basketball", subtitle: "Hoops and teamwork", imageName: "figure.basketball", rating: 4),
        FavoriteItem(title: "Tennis", subtitle: "Racket sport on court", imageName: "figure.tennis", rating: 4),
        FavoriteItem(title: "Boxing", subtitle: "Combat sport and discipline", imageName: "figure.boxing", rating: 4),
        FavoriteItem(title: "Volleyball", subtitle: "Net and ball team sport", imageName: "figure.volleyball", rating: 4),
        FavoriteItem(title: "Judo", subtitle: "Modern Japanese martial art", imageName: "figure.judo", rating: 5),
        FavoriteItem(title: "Skiing", subtitle: "Winter outdoor sport", imageName: "figure.skiing.downhill", rating: 3),
        FavoriteItem(title: "Cycling", subtitle: "Bicycle racing and riding", imageName: "figure.outdoor.cycle", rating: 4),
        FavoriteItem(title: "Athletics", subtitle: "Running, jumping, and throwing", imageName: "figure.run", rating: 5),
        FavoriteItem(title: "Table Tennis", subtitle: "Fast-paced ping pong", imageName: "figure.table.tennis", rating: 3),
        FavoriteItem(title: "Ice Hockey", subtitle: "Fast team sport on ice", imageName: "figure.hockey", rating: 4),
        FavoriteItem(title: "Archery", subtitle: "Precision and focus sport", imageName: "figure.archery", rating: 4),
        FavoriteItem(title: "Gymnastics", subtitle: "Flexibility and balance", imageName: "figure.gymnastics", rating: 5),
        FavoriteItem(title: "Golf", subtitle: "Precision club-and-ball sport", imageName: "figure.golf", rating: 3),
        FavoriteItem(title: "Weightlifting", subtitle: "Strength training sport", imageName: "figure.strengthtraining.traditional", rating: 4),
        FavoriteItem(title: "Surfing", subtitle: "Surface water sport", imageName: "figure.surfing", rating: 4),
        FavoriteItem(title: "Chess", subtitle: "Intellectual board sport", imageName: "gamecontroller", rating: 5),
        FavoriteItem(title: "Badminton", subtitle: "Racquet sport with a shuttlecock", imageName: "figure.badminton", rating: 3)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Ұяшықты код арқылы тікелей тіркеу
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: "FavoriteCell")
    }    }

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as? FavoriteCell else {
            return UITableViewCell()
        }
        
        let sport = sports[indexPath.row]
        cell.configure(with: sport)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
}
