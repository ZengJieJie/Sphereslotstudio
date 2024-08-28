//
//  SphereslotHomeViewController.swift
//  SphereslotStudio
//
//  Created by adin on 2024/8/27.
//

import UIKit

class SphereslotHomeViewController: SphereslotBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func backclick(_ sender: Any) {
        self.dismiss(animated: true)
        
    }
    
    @IBAction func slotgamec(_ sender: Any) {
       
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeNav = (storyboard.instantiateViewController(withIdentifier: "SPHgamevc") as? SphereslotGameViewController)!
       
        self.present(homeNav, animated: true, completion: nil)
    }
    
    @IBAction func fishslogcloick(_ sender: Any) {
      
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let svc = (storyboard.instantiateViewController(withIdentifier: "SPHslotvc") as? SphereslotGViewController)!
        self.present(svc, animated: true, completion: nil)
    }
    
    @IBAction func choserfishclikc(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let CVC = (storyboard.instantiateViewController(withIdentifier: "SPHCvc") as? SphereslotSlotViewController)!
       
        self.present(CVC, animated: true, completion: nil)
    }
    
    @IBAction func SETCLICK(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let setvc = (storyboard.instantiateViewController(withIdentifier: "SPHsetvc") as? SphereslotSetViewController)!
       
        self.present(setvc, animated: true, completion: nil)
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
