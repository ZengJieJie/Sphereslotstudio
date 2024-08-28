//
//  SphereslotGameViewController.swift
//  SphereslotStudio
//
//  Created by adin on 2024/8/27.
//

import UIKit
import SwiftyGif

class SphereslotGameViewController: SphereslotBaseViewController {

    //MARK: - Declare IBOutlets
    @IBOutlet weak var slotPickerOne: UIPickerView!
    @IBOutlet weak var slotPickerTwo: UIPickerView!
    @IBOutlet weak var slotPickerThree: UIPickerView!
    @IBOutlet weak var btnSpinner: UIButton!
    @IBOutlet weak var pointsLabel: UILabel!
    
    //MARK: - Declare Variables
    var itemArray = ["1", "2", "3", "4", "5", "6", "7", "8","9"]
    var extendedItemArray: [String] = []
    var points = 100
    
    let infiniteMultiplier = 100
    
    //MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ensure only valid image names are included
        let validItemArray = itemArray.filter { UIImage(named: $0) != nil }
        extendedItemArray = Array(repeating: validItemArray, count: infiniteMultiplier).flatMap { $0 }
        
        slotPickerOne.dataSource = self
        slotPickerOne.delegate = self
        slotPickerTwo.dataSource = self
        slotPickerTwo.delegate = self
        slotPickerThree.dataSource = self
        slotPickerThree.delegate = self
        
        setInitialPickerPositions()
        updatePointsLabel()
        
        do {
            let gif = try UIImage(gifName: "MyImage.gif")
            let imageview = UIImageView(gifImage: gif, loopCount: 3) // Will loop 3 times
            imageview.frame = view.bounds
        } catch {
            print(error)
        }
    }
    
    //MARK: - Functions
    func setInitialPickerPositions() {
        let middleIndex = (extendedItemArray.count / 2)
        slotPickerOne.selectRow(middleIndex, inComponent: 0, animated: false)
        slotPickerTwo.selectRow(middleIndex, inComponent: 0, animated: false)
        slotPickerThree.selectRow(middleIndex, inComponent: 0, animated: false)
    }
    
    func spinPicker(_ pickerView: UIPickerView) {
        let middleIndex = (extendedItemArray.count / 2)
        let randomOffset = Int.random(in: 0..<itemArray.count)
        let targetIndex = middleIndex + randomOffset
        pickerView.selectRow(targetIndex, inComponent: 0, animated: true)
    }
    
    func calculatePoints() {
        let rowOne = slotPickerOne.selectedRow(inComponent: 0) % itemArray.count
        let rowTwo = slotPickerTwo.selectedRow(inComponent: 0) % itemArray.count
        let rowThree = slotPickerThree.selectedRow(inComponent: 0) % itemArray.count
        
        let selectedItems = [itemArray[rowOne], itemArray[rowTwo], itemArray[rowThree]]
        
        let uniqueItems = Set(selectedItems)
        
        if uniqueItems.count == 1 {
            switch selectedItems[0] {
            case "7":
                points += 20
            case "5":
                points += 15
            case "3":
                points += 10
            default:
                points += 20
            }
            zoomInOutAnimation()
        } else if uniqueItems.count == 2 {
            points += 5
        } else {
            points -= 5
        }
        
        updatePointsLabel()
        if points <= 0 {
            restartGame()
        }
    }
    
    func zoomInOutAnimation() {
        UIView.animate(withDuration: 0.3, animations: {
            self.slotPickerOne.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.slotPickerTwo.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            self.slotPickerThree.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { _ in
            UIView.animate(withDuration: 0.3, animations: {
                self.slotPickerOne.transform = .identity
                self.slotPickerTwo.transform = .identity
                self.slotPickerThree.transform = .identity
            })
        }
    }
    
    func updatePointsLabel() {
        pointsLabel.text = "Points: \(points)"
        self.btnSpinner.isEnabled = true
    }
    
    func restartGame() {
        
        let alert = UIAlertController(title: "Game Over", message: "Your points have reached 0. The game will restart.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.points = 100
            self.updatePointsLabel()
            self.setInitialPickerPositions()
            
        }))
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Declare IBAction
    @IBAction func btnSpinSlot(_ sender: Any) {
        self.btnSpinner.isEnabled = false
        spinPicker(slotPickerOne)
        spinPicker(slotPickerTwo)
        spinPicker(slotPickerThree)
        
        // Calculate points after the spinning animation completes
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.calculatePoints()
        }
    }
    
    @IBAction func backclick(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    @IBAction func btnBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - UIPickerViewDataSource and UIPickerViewDelegate Methods
extension SphereslotGameViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return extendedItemArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        imageView.contentMode = .scaleAspectFit
        
        // Ensure image name is valid to avoid empty images
        let imageName = extendedItemArray[row]
        if let image = UIImage(named: imageName) {
            imageView.image = image
        } else {
            imageView.image = nil
        }
        
        imageView.frame = CGRect(x: 0, y: 0, width: pickerView.frame.width, height: 30)
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
}
