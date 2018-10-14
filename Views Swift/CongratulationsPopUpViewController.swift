//
//  CongratulationsPopUpViewController.swift
//  lucky-guess
//
//  Created by Tomás Santiago on 05/08/18.
//  Copyright © 2018 Tomás Santiago. All rights reserved.
//

import UIKit

class CongratulationsPopUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is StartScreenVC {
            let vc: StartScreenVC = (segue.destination as? StartScreenVC)!
            vc.gameCompleted = true
            vc.guessedNumber = true
        }
    }
    
    
    

}
