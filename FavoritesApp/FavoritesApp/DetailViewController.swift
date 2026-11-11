import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    var itemTitle: String?
    var itemSubtitle: String?
    var itemRating: String?
    var itemDescription: String?
    var imageName: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Деректерді экран элементтеріне жүктейміз
        titleLabel?.text = itemTitle
        subtitleLabel?.text = itemSubtitle
        ratingLabel?.text = itemRating
        descriptionLabel?.text = itemDescription

        if let imageName = imageName {
            carImageView?.image = UIImage(named: imageName)
        }
    }
}
