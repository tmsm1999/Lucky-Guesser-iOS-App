//
//  difficultyPopUp.swift
//  lucky-guess
//
//  Created by Tomás Santiago on 06/08/18.
//  Copyright © 2018 Tomás Santiago. All rights reserved.
//

import UIKit

class difficultyPopUp: UIViewController {
    
    var triesEasy: Int = 8
    var triesNormal: Int = 6
    var triesDifficult: Int = 4
    
    @IBOutlet weak var easyButton: RoundCornersButton!
    @IBOutlet weak var normalButton: RoundCornersButton!
    @IBOutlet weak var difficultButton: RoundCornersButton!
    
    @IBAction func numberTriesEasy(_ sender: Any) {
        
    }
    @IBAction func numberTriesNormal(_ sender: Any) {
        
    }
    @IBAction func numberTriesDifficult(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is GameVC {
            let vc: GameVC = (segue.destination as? GameVC)!
            if easyButton.isTouchInside {
                vc.numberOfTries = 8
            }
            else if normalButton.isTouchInside {
                vc.numberOfTries = 6
            }
            else if difficultButton.isTouchInside {
                vc.numberOfTries = 4
            }
        }
    }
    
    

}
