//
//  ViewController.swift
//  lucky-guess
//
//  Created by Tomás Santiago on 04/08/18.
//  Copyright © 2018 Tomás Santiago. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    
    var numberToGuess: Int!
    var numberOfDigits: Int = 4
    var fourTimesPressed: Int = 0
    var numberOfTries: Int = 4
    
    var wonGame: Bool = false
    var pointsToWin: Int = 0
    
    @IBOutlet weak var GameOverView: RoundCornersView!
    
    @IBOutlet weak var CongratulationsView: RoundCornersView!
    @IBOutlet weak var pointsWonLabel: UILabel!
    
    
    @IBOutlet weak var numberToGuessGameOver: UILabel!
    @IBOutlet weak var whiteView: UIView!
    
    @IBOutlet weak var GuessOne: RoundCorners!
    @IBOutlet weak var GuessTwo: RoundCorners!
    @IBOutlet weak var GuessThree: RoundCorners!
    @IBOutlet weak var GuessFour: RoundCorners!
    
    @IBOutlet weak var SignalOne: Circle!
    @IBOutlet weak var SignalTwo: Circle!
    @IBOutlet weak var SignalThree: Circle!
    @IBOutlet weak var SignalFour: Circle!
    
    @IBOutlet weak var ButtonOne: RoundCornersButton!
    @IBOutlet weak var ButtonTwo: RoundCornersButton!
    @IBOutlet weak var ButtonThree: RoundCornersButton!
    @IBOutlet weak var ButtonFour: RoundCornersButton!
    @IBOutlet weak var ButtonFive: RoundCornersButton!
    @IBOutlet weak var ButtonSix: RoundCornersButton!
    @IBOutlet weak var ButtonSeven: RoundCornersButton!
    @IBOutlet weak var ButtonEight: RoundCornersButton!
    @IBOutlet weak var ButtonNine: RoundCornersButton!
    @IBOutlet weak var ButtonZero: RoundCornersButton!
    
    @IBOutlet weak var triesleft: UILabel!
    @IBOutlet weak var smilesTries: UILabel!
    @IBOutlet weak var numberLabel: RoundCorners!
    
    @IBOutlet weak var endGameButton: RoundCornersButton!
    @IBOutlet weak var CheckButtonOutlet: RoundCornersButton!
    
    @IBAction func OnePressed(_ sender: Any) {
        numberLabel.text! = numberLabel.text! + "1"
        numberButtonPressed()
    }
    @IBAction func TwoPressed(_ sender: Any) {
        numberLabel.text! = numberLabel.text! + "2"
        numberButtonPressed()
    }
    @IBAction func ThreePressed(_ sender: Any) {
        numberLabel.text! = numberLabel.text! + "3"
        numberButtonPressed()
    }
    @IBAction func FourPressed(_ sender: Any) {
        numberLabel.text! = numberLabel.text! + "4"
        numberButtonPressed()
    }
    @IBAction func FivePressed(_ sender: Any) {
        numberLabel.text! = numberLabel.text! + "5"
        numberButtonPressed()
    }
    @IBAction func SixPressed(_ sender: Any) {
        numberLabel.text! = numberLabel.text! + "6"
        numberButtonPressed()
    }
    @IBAction func SevenPressed(_ sender: Any) {
        numberLabel.text! = numberLabel.text! + "7"
        numberButtonPressed()
    }
    @IBAction func EightPressed(_ sender: Any) {
        numberLabel.text! = numberLabel.text! + "8"
        numberButtonPressed()
    }
    @IBAction func NinePressed(_ sender: Any) {
        numberLabel.text! = numberLabel.text! + "9"
        numberButtonPressed()
    }
    @IBAction func ZeroPressed(_ sender: Any) {
        numberLabel.text! = numberLabel.text! + "0"
        numberButtonPressed()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if numberOfTries == 8 {
            smilesTries.text! = "🤣"
            pointsToWin = 5
        }
        else if numberOfTries == 6 {
            smilesTries.text! = "🤓"
            pointsToWin = 10
        }
        else if numberOfTries == 4 {
            smilesTries.text! = "🧐"
            pointsToWin = 20
        }
        
        let newNumber = NumberGenerator()
        numberToGuess = newNumber.number
        print(numberToGuess)
        startFunc()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startFunc() {
        enableNumbers()
        CheckButtonOutlet.isEnabled = false
        numberLabel.text = ""
        GuessOne.text = ""
        GuessTwo.text = ""
        GuessThree.text = ""
        GuessFour.text = ""
        triesleft.text! = String(numberOfTries)
    }
    
    func checkFourTimes() -> Bool {
        if fourTimesPressed == 4 {
            fourTimesPressed = 0
            ButtonOne.isEnabled = false
            ButtonTwo.isEnabled = false
            ButtonThree.isEnabled = false
            ButtonFour.isEnabled = false
            ButtonFive.isEnabled = false
            ButtonSix.isEnabled = false
            ButtonSeven.isEnabled = false
            ButtonEight.isEnabled = false
            ButtonNine.isEnabled = false
            ButtonZero.isEnabled = false
            
            return true
        }
        return false
    }
    
    func numberButtonPressed() {
        fourTimesPressed = fourTimesPressed + 1
        if(checkFourTimes()) {
            CheckButtonOutlet.isEnabled = true
        }
    }
    
    func enableNumbers() {
        fourTimesPressed = 0
        ButtonOne.isEnabled = true
        ButtonTwo.isEnabled = true
        ButtonThree.isEnabled = true
        ButtonFour.isEnabled = true
        ButtonFive.isEnabled = true
        ButtonSix.isEnabled = true
        ButtonSeven.isEnabled = true
        ButtonEight.isEnabled = true
        ButtonNine.isEnabled = true
        ButtonZero.isEnabled = true
    }
    
    func changeColor() {
        var number: [Character]!
        var guess: [Character]!
        if numberToGuess < 1000  && numberToGuess >= 100{
            let addZero: String = "0" + String(numberToGuess)
            number = Array(String(addZero))
            guess = Array(numberLabel.text!)
        }
        else if numberToGuess < 100 && numberToGuess >= 10 {
            let addZero: String = "00" + String(numberToGuess)
            number = Array(String(addZero))
            guess = Array(numberLabel.text!)
        }
        else if numberToGuess < 10 {
            let addZero: String = "000" + String(numberToGuess)
            number = Array(String(addZero))
            guess = Array(numberLabel.text!)
        }
        else {
            number = Array(String(numberToGuess))
            guess = Array(numberLabel.text!)
        }
        
        if number[0] == guess[0] {
            SignalOne.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        }
        else {
            SignalOne.backgroundColor = #colorLiteral(red: 1, green: 0.1495908109, blue: 0.008639783522, alpha: 1)
        }
        DispatchQueue.main.async {
            self.GuessOne.text = String(guess[0])
        }
        
        if number[1] == guess[1] {
            SignalTwo.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        }
        else {
            SignalTwo.backgroundColor = #colorLiteral(red: 1, green: 0.1495908109, blue: 0.008639783522, alpha: 1)
        }
        DispatchQueue.main.async {
            self.GuessTwo.text! = String(guess[1])
        }
        
        if number[2] == guess[2] {
            SignalThree.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        }
        else {
            SignalThree.backgroundColor = #colorLiteral(red: 1, green: 0.1495908109, blue: 0.008639783522, alpha: 1)
        }
        DispatchQueue.main.async {
            self.GuessThree.text! = String(guess[2])
        }
        
        if number[3] == guess[3] {
            SignalFour.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        }
        else {
            SignalFour.backgroundColor = #colorLiteral(red: 1, green: 0.1495908109, blue: 0.008639783522, alpha: 1)
        }
        DispatchQueue.main.async {
            self.GuessFour.text! = String(guess[3])
        }
        
    }

    @IBAction func CheckNumber(_ sender: Any) {
        changeColor()
        if Int(numberLabel.text!) == numberToGuess {
            whiteView.isHidden = false
            whiteView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
            pointsWonLabel.text! = String(pointsToWin)
            CongratulationsView.isHidden = false
            wonGame = true
            
        }
        else {
            numberOfTries = numberOfTries - 1
            triesleft.text = String(numberOfTries)
            
            if numberOfTries == 8 {
                smilesTries.text! = "🤣"
            }
            else if numberOfTries == 7 {
                smilesTries.text! = "😎"
            }
            else if numberOfTries == 6 {
                smilesTries.text! = "🤓"
            }
            else if numberOfTries == 5 {
                smilesTries.text! = "😁"
            }
            else if numberOfTries == 4 {
                smilesTries.text! = "🧐"
            }
            else if numberOfTries == 3 {
                smilesTries.text! = "🤯"
            }
            else if numberOfTries == 2 {
                smilesTries.text! = "😩"
            }
            else if numberOfTries == 1 {
                smilesTries.text! = "😰"
            }
            else if numberOfTries == 0 {
                smilesTries.text! = "😵"
                whiteView.isHidden = false
                whiteView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
                numberToGuessGameOver.text! = String(numberToGuess)
                GameOverView.isHidden = false
                wonGame = false
            }
            startFunc()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is StartScreenVC {
            let vc: StartScreenVC = (segue.destination as? StartScreenVC)!
            if wonGame {
                vc.gameCompleted = true
                vc.guessedNumber = true
                vc.pointsWon = pointsToWin
            }
            else {
                vc.gameCompleted = true
                vc.guessedNumber = false
            }
        }
    }
    
    @IBAction func EndGame(_ sender: Any) {
        let popUpViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "subViewPopUpID") as! EndGamePopUpViewController
        self.addChildViewController(popUpViewController)
        popUpViewController.view.frame = self.view.frame
        self.view.addSubview(popUpViewController.view)
        popUpViewController.didMove(toParentViewController: self)
    }
    
}
