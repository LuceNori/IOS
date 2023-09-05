import UIKit
class DetailViewController: UIViewController {
    @IBOutlet weak var animeDescription: UILabel!
    @IBOutlet weak var animeGenre: UILabel!
    @IBOutlet weak var animeImageView: UIImageView!
    @IBOutlet weak var animeTitle: UILabel!
    
    var anime: Anime!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        animeImageView.layer.cornerRadius = 8
        animeImageView.layer.masksToBounds = true
        animeImageView.contentMode = .scaleAspectFill
        animeImageView.backgroundColor = .blue
        
        animeTitle.text = anime.title
       
    }
}

