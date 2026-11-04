import UIKit
import AVFoundation

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
  
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    // MARK: - Properties
    var tracks: [Track] = Track.allTracks
    var currentIndex: Int = 0
    var audioPlayer: AVAudioPlayer?
    var isPlaying: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        loadTrack(at: currentIndex)
        
        // Style the album cover image corners
        coverImageView.layer.cornerRadius = 16
        coverImageView.clipsToBounds = true
    }

    // Load and prepare the track
    func loadTrack(at index: Int) {
        let track = tracks[index]
        
        titleLabel.text = track.title
        artistLabel.text = track.artist
        coverImageView.image = UIImage(named: track.coverName)
        
        // Setup audio player (.mp3 files must be included in the project bundle)
        if let path = Bundle.main.path(forResource: track.fileName, ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay()
            } catch {
                print("Error loading audio: \(error.localizedDescription)")
            }
        }
    }

    // MARK: - IBActions
    
    @IBAction func playPauseTapped(_ sender: Any) {
    
        if isPlaying {
            audioPlayer?.pause()
            isPlaying = false
            playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            audioPlayer?.play()
            isPlaying = true
            playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }

    @IBAction func previousTapped(_ sender: Any) {
    
        currentIndex = (currentIndex - 1 + tracks.count) % tracks.count
        loadTrack(at: currentIndex)
        if isPlaying {
            audioPlayer?.play()
        }
    }

    @IBAction func nextTapped(_ sender: Any) {
   
        currentIndex = (currentIndex + 1) % tracks.count
        loadTrack(at: currentIndex)
        if isPlaying {
            audioPlayer?.play()
        }
    }
}
