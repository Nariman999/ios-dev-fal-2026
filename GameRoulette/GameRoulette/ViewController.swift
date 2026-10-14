import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var gameDescriptionLabel: UILabel!
    @IBOutlet weak var gameTitleLabel: UILabel!
    private var lastIndex: Int = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        showRandomGame()
    }

    @IBAction func chooseButtonTapped(_ sender:UIButton) {
        showRandomGame()
    }

    private func showRandomGame() {
        var randomIndex: Int
        
        repeat {
            randomIndex = Int.random(in: 0..<gamesList.count)
        } while randomIndex == lastIndex
        
        lastIndex = randomIndex
        let game = gamesList[randomIndex]
        
        gameImageView.image = UIImage(named: game.imageName)
        gameTitleLabel.text = game.title
        gameDescriptionLabel.text = game.description
    }
}
