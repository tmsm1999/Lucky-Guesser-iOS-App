//
//  StartScreenVC.swift
//  lucky-guess
//
//  Created by Tomás Santiago on 06/08/18.
//  Copyright © 2018 Tomás Santiago. All rights reserved.
//

import UIKit

class StartScreenVC: UIViewController {
    let defaults = UserDefaults.standard
    
    var guessedNumber: Bool = false
    var gameCompleted: Bool = false
    var pointsWon : Int = 0
    var currentLevel: Int = 0
    
    var passValueToFunction: Int = 0
    
    @IBOutlet weak var gamesCompletedLabel: UILabel!
    @IBOutlet weak var numbersGuessedLabel: UILabel!
    @IBOutlet weak var circularProgressView: CircularProgressView!
    @IBOutlet weak var percentageCircularView: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    
    @IBOutlet weak var levelUpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circularProgressView.trackColor = UIColor(red: 255/255, green: 179/255, blue: 102/255, alpha: 1.0)
        circularProgressView.progressColor = UIColor(red: 255/255, green: 119/255, blue: 0/255, alpha: 1.0)
        
        var levelPoints: Int = defaults.integer(forKey: "levelPoints")
        defaults.set(levelPoints + pointsWon, forKey: "levelPoints")
        levelPoints = defaults.integer(forKey: "levelPoints")
        
        currentLevel = defaults.integer(forKey: "level")
        
        if levelPoints >= 100 {
            levelPoints = levelPoints - 100
            defaults.set(levelPoints, forKey: "levelPoints")
            currentLevel = currentLevel + 1
            defaults.set(currentLevel, forKey: "level")
            levelLabel.text! = String(defaults.integer(forKey: "level"))
            levelUpView.isHidden = false
            levelUpView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
            
        }
        else {
            if (defaults.integer(forKey: "level") == 0) {
                defaults.set(1, forKey: "level")
            }
            levelLabel.text! = String(defaults.integer(forKey: "level"))
        }
        percentageCircularView.text! = String(levelPoints)
        passValueToFunction = levelPoints
        
        self.perform(#selector(animateProgress), with: nil, afterDelay: 1.0)
        
        let gamesCompleted: Int = defaults.integer(forKey: "games")
        gamesCompletedLabel.text! = String(gamesCompleted)
        
        let numbersGuessed: Int = defaults.integer(forKey: "numbers")
        numbersGuessedLabel.text! = String(numbersGuessed)
        
        if gameCompleted {
            defaults.set(gamesCompleted + 1, forKey: "games")
            gamesCompletedLabel.text! = String(defaults.integer(forKey: "games"))
        }
        if guessedNumber {
            defaults.set(gamesCompleted + 1, forKey: "games")
            gamesCompletedLabel.text! = String(defaults.integer(forKey: "games"))
            
            defaults.set(numbersGuessed + 1, forKey: "numbers")
            numbersGuessedLabel.text! = String(defaults.integer(forKey: "numbers"))
        }
        else if gameCompleted {
            defaults.set(gamesCompleted + 1, forKey: "games")
            gamesCompletedLabel.text! = String(defaults.integer(forKey: "games"))
        }
    }
    
    @objc func animateProgress() {
        circularProgressView.setProgressWithAnimation(duration: 2.0, value: Float(passValueToFunction)/100)
    }
    
    @IBAction func showDifficultyPopUp(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chooseDifficultyVC") as! difficultyPopUp
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    @IBAction func closeLevelUpView(_ sender: Any) {
        levelUpView.isHidden = true
    }
    
    
}
