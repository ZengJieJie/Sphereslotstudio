//
//  SphereslotSetViewController.swift
//  SphereslotStudio
//
//  Created by adin on 2024/8/27.
//

import UIKit

class SphereslotSetViewController: SphereslotBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func beckclikc(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func aboutusclick(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let ABBBOUTVC = (storyboard.instantiateViewController(withIdentifier: "SPHAboutVC") as? SphereslotAboutViewController)!
       
        self.present(ABBBOUTVC, animated: true, completion: nil)
    }
    
    @IBAction func priclikc(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let privc = (storyboard.instantiateViewController(withIdentifier: "SPHPrivacyVC") as? SphereslotPriViewController)!
        
        self.present(privc, animated: true, completion: nil)
    }
    
    
    @IBAction func feebclick(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let FEEBVC = (storyboard.instantiateViewController(withIdentifier: "SPHFeedbackVC") as? SphereslotFeebViewController)!
       
        self.present(FEEBVC, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
