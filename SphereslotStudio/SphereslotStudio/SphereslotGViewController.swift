//
//  SphereslotGViewController.swift
//  SphereslotStudio
//
//  Created by adin on 2024/8/27.
//

import UIKit

class SphereslotGViewController: SphereslotBaseViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var slot1: UIImageView!
    @IBOutlet weak var slot2: UIImageView!
    @IBOutlet weak var slot3: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var selectedFishLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!

    var fishImages = ["1", "2", "3", "4", "5", "6"]
    var selectedSlots: [UIImageView] = []
    var selectedFishNames: [String] = []
    var score: Int = 0
    let pointsPerWin = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGame()
    }

    func setupGame() {
        // Initialize score
        score = 0
        updateScoreLabel()
        selectedFishLabel.text = "Select 3 fish!"
        instructionLabel.text = "Tap on three slots to find the matching fish!"
        instructionLabel.isHidden = false

        // Reset selected slots and fish names
        selectedSlots.removeAll()
        selectedFishNames.removeAll()

        // Reset slot images
        slot1.image = nil
        slot2.image = nil
        slot3.image = nil

        messageLabel.text = ""

        // Enable user interaction
        slot1.isUserInteractionEnabled = true
        slot2.isUserInteractionEnabled = true
        slot3.isUserInteractionEnabled = true

        // Add tap gestures to slots
        addTapGestures()
    }

    @IBAction func backclick(_ sender: Any) {
        self.dismiss(animated: true)
    }
    func addTapGestures() {
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(slotTapped(_:)))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(slotTapped(_:)))
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(slotTapped(_:)))

        slot1.addGestureRecognizer(tapGesture1)
        slot2.addGestureRecognizer(tapGesture2)
        slot3.addGestureRecognizer(tapGesture3)
    }

    @objc func slotTapped(_ sender: UITapGestureRecognizer) {
        guard let tappedSlot = sender.view as? UIImageView else { return }

        // Hide the instruction label when the game starts
        instructionLabel.isHidden = true

        // If the slot is already selected, ignore the tap
        if selectedSlots.contains(tappedSlot) { return }

        // Randomly select a fish image for the tapped slot
        let randomFish = fishImages.randomElement()!
        tappedSlot.image = UIImage(named: randomFish)
        tappedSlot.isUserInteractionEnabled = false // Prevent tapping the same slot again

        // Add to selected slots and fish names
        selectedSlots.append(tappedSlot)
        selectedFishNames.append(randomFish)

        // Display selected fish in label
        selectedFishLabel.text = "Selected fish: \(selectedFishNames.joined(separator: ", "))"

        // If three slots are selected, check if the user wins
        if selectedSlots.count == 3 {
            checkWinCondition()
        }
    }

    func checkWinCondition() {
        // Check if all selected slots have the same fish image
        if selectedFishNames.allSatisfy({ $0 == selectedFishNames.first }) {
            // User wins
            score += pointsPerWin
            messageLabel.text = "You win \(pointsPerWin) points!"
            showAlert(title: "Congratulations!", message: "You matched all three fish! Your score is \(score).")
        } else {
            // User does not win
            messageLabel.text = "No match, try again!"
            showAlert(title: "Try Again", message: "No match, try again!")
        }
        updateScoreLabel()
    }

    func updateScoreLabel() {
        scoreLabel.text = "Score: \(score)"
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.setupGame()
        }))
        present(alert, animated: true)
    }
}
