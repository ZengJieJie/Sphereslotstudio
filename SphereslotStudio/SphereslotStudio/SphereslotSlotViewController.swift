//
//  SphereslotSlotViewController.swift
//  SphereslotStudio
//
//  Created by adin on 2024/8/27.
//

import UIKit

class SphereslotSlotViewController: SphereslotBaseViewController {

    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var fishone: UIImageView!
    @IBOutlet weak var fish2: UIImageView!
    @IBOutlet weak var fish3: UIImageView!
    @IBOutlet weak var fish4: UIImageView! // Additional fish
    @IBOutlet weak var fish5: UIImageView! // Additional fish
    @IBOutlet weak var fish6: UIImageView! // Additional fish
    @IBOutlet weak var scoreLabel: UILabel!

    var fishImages = ["1", "2", "3", "4", "5", "6"]
    var targetFish: String?
    var score: Int = 0
    let pointsPerCorrectFind = 10
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGame()
    }

    @IBAction func bbackclikc(_ sender: Any) {
        self.dismiss(animated: true)
    }
    func setupGame() {
        // Initialize score
        score = 0
        updateScoreLabel()

        // Randomly select a fish as the target
        targetFish = fishImages.randomElement()

        // Set images for the fish
        setupFishImages()

        // Add tap gestures to fish images
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(fishTapped(_:)))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(fishTapped(_:)))
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(fishTapped(_:)))
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(fishTapped(_:)))
        let tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(fishTapped(_:)))
        let tapGesture6 = UITapGestureRecognizer(target: self, action: #selector(fishTapped(_:)))

        fishone.isUserInteractionEnabled = true
        fish2.isUserInteractionEnabled = true
        fish3.isUserInteractionEnabled = true
        fish4.isUserInteractionEnabled = true
        fish5.isUserInteractionEnabled = true
        fish6.isUserInteractionEnabled = true

        fishone.addGestureRecognizer(tapGesture1)
        fish2.addGestureRecognizer(tapGesture2)
        fish3.addGestureRecognizer(tapGesture3)
        fish4.addGestureRecognizer(tapGesture4)
        fish5.addGestureRecognizer(tapGesture5)
        fish6.addGestureRecognizer(tapGesture6)
    }

    func setupFishImages() {
        // Shuffle the images and select six
        let allFish = fishImages.shuffled()
        let randomFishImages = Array(allFish.prefix(6))

        // Assign images and set accessibility identifiers
        fishone.image = UIImage(named: randomFishImages[0])
        fishone.accessibilityIdentifier = randomFishImages[0]
        
        fish2.image = UIImage(named: randomFishImages[1])
        fish2.accessibilityIdentifier = randomFishImages[1]

        fish3.image = UIImage(named: randomFishImages[2])
        fish3.accessibilityIdentifier = randomFishImages[2]

        fish4.image = UIImage(named: randomFishImages[3])
        fish4.accessibilityIdentifier = randomFishImages[3]

        fish5.image = UIImage(named: randomFishImages[4])
        fish5.accessibilityIdentifier = randomFishImages[4]

        fish6.image = UIImage(named: randomFishImages[5])
        fish6.accessibilityIdentifier = randomFishImages[5]
    }

    @objc func fishTapped(_ sender: UITapGestureRecognizer) {
        if let tappedFish = sender.view as? UIImageView {
            // Get the tapped fish's image name
            let tappedFishImageName = tappedFish.accessibilityIdentifier
            
            if let targetFishName = targetFish {
                if tappedFishImageName == targetFishName {
                    // User found the correct fish, increase score
                    score += pointsPerCorrectFind
                    messageLabel.text = "You found the Coin! You win \(pointsPerCorrectFind) points!"
                    showAlert(title: "Congratulations!", message: "You found the Coin! Your score is \(score).")
                } else {
                    // User selected the wrong fish
                    messageLabel.text = "Wrong fish! Try again!"
                    showAlert(title: "Try Again", message: "You picked the wrong fish. Try again!")
                }
                updateScoreLabel()
                // Optionally, you can restart the game or move to the next round here
            }
        }
    }

    func updateScoreLabel() {
        scoreLabel.text = "Score: \(score)"
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
