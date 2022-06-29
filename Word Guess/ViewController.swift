//
//  ViewController.swift
//  Word Guess
//
//  Created by Sampath Bandara on 2022-06-25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonSubmitWord: UIButton!
    
    @IBOutlet weak var textField11: UITextField!
    @IBOutlet weak var textField12: UITextField!
    @IBOutlet weak var textField13: UITextField!
    @IBOutlet weak var textField14: UITextField!
    @IBOutlet weak var textField15: UITextField!
    @IBOutlet weak var textField21: UITextField!
    @IBOutlet weak var textField22: UITextField!
    @IBOutlet weak var textField23: UITextField!
    @IBOutlet weak var textField24: UITextField!
    @IBOutlet weak var textField25: UITextField!
    @IBOutlet weak var textField31: UITextField!
    @IBOutlet weak var textField32: UITextField!
    @IBOutlet weak var textField33: UITextField!
    @IBOutlet weak var textField34: UITextField!
    @IBOutlet weak var textField35: UITextField!
    @IBOutlet weak var textField41: UITextField!
    @IBOutlet weak var textField42: UITextField!
    @IBOutlet weak var textField43: UITextField!
    @IBOutlet weak var textField44: UITextField!
    @IBOutlet weak var textField45: UITextField!
    @IBOutlet weak var textField51: UITextField!
    @IBOutlet weak var textField52: UITextField!
    @IBOutlet weak var textField53: UITextField!
    @IBOutlet weak var textField54: UITextField!
    @IBOutlet weak var textField55: UITextField!
    @IBOutlet weak var textField61: UITextField!
    @IBOutlet weak var textField62: UITextField!
    @IBOutlet weak var textField63: UITextField!
    @IBOutlet weak var textField64: UITextField!
    @IBOutlet weak var textField65: UITextField!
    
    @IBOutlet weak var buttonQ: UIButton!
    @IBOutlet weak var buttonW: UIButton!
    @IBOutlet weak var buttonE: UIButton!
    @IBOutlet weak var buttonR: UIButton!
    @IBOutlet weak var buttonT: UIButton!
    @IBOutlet weak var buttonY: UIButton!
    @IBOutlet weak var buttonU: UIButton!
    @IBOutlet weak var buttonI: UIButton!
    @IBOutlet weak var buttonO: UIButton!
    @IBOutlet weak var buttonP: UIButton!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonS: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    @IBOutlet weak var buttonF: UIButton!
    @IBOutlet weak var buttonG: UIButton!
    @IBOutlet weak var buttonH: UIButton!
    @IBOutlet weak var buttonJ: UIButton!
    @IBOutlet weak var buttonK: UIButton!
    @IBOutlet weak var buttonL: UIButton!
    @IBOutlet weak var buttonZ: UIButton!
    @IBOutlet weak var buttonX: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonV: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonN: UIButton!
    @IBOutlet weak var buttonM: UIButton!
    @IBOutlet weak var buttonDelete: UIButton!
    
    var numberFocused: Int = 0
    var numberToFocus: Int = 0
    var guessNumber: Int = 0
    var buttonSubmitEnabled: Bool = false
    var correctGuess: Bool = false
    var guessedWord: String = ""
    var randomWord: String = ""
    
    // Did not use these. Couldn't delete since time consuming
    var coloredButtonQ : Bool = false
    var coloredButtonW : Bool = false
    var coloredButtonE : Bool = false
    var coloredButtonR : Bool = false
    var coloredButtonT : Bool = false
    var coloredButtonY : Bool = false
    var coloredButtonU : Bool = false
    var coloredButtonI : Bool = false
    var coloredButtonO : Bool = false
    var coloredButtonP : Bool = false
    var coloredButtonA : Bool = false
    var coloredButtonS : Bool = false
    var coloredButtonD : Bool = false
    var coloredButtonF : Bool = false
    var coloredButtonG : Bool = false
    var coloredButtonH : Bool = false
    var coloredButtonJ : Bool = false
    var coloredButtonK : Bool = false
    var coloredButtonL : Bool = false
    var coloredButtonZ : Bool = false
    var coloredButtonX : Bool = false
    var coloredButtonC : Bool = false
    var coloredButtonV : Bool = false
    var coloredButtonB : Bool = false
    var coloredButtonN : Bool = false
    var coloredButtonM : Bool = false
    
    // Used these insted of the above
    var coloredButtonQ2 : Bool = false
    var coloredButtonW2 : Bool = false
    var coloredButtonE2 : Bool = false
    var coloredButtonR2 : Bool = false
    var coloredButtonT2 : Bool = false
    var coloredButtonY2 : Bool = false
    var coloredButtonU2 : Bool = false
    var coloredButtonI2 : Bool = false
    var coloredButtonO2 : Bool = false
    var coloredButtonP2 : Bool = false
    var coloredButtonA2 : Bool = false
    var coloredButtonS2 : Bool = false
    var coloredButtonD2 : Bool = false
    var coloredButtonF2 : Bool = false
    var coloredButtonG2 : Bool = false
    var coloredButtonH2 : Bool = false
    var coloredButtonJ2 : Bool = false
    var coloredButtonK2 : Bool = false
    var coloredButtonL2 : Bool = false
    var coloredButtonZ2 : Bool = false
    var coloredButtonX2 : Bool = false
    var coloredButtonC2 : Bool = false
    var coloredButtonV2 : Bool = false
    var coloredButtonB2 : Bool = false
    var coloredButtonN2 : Bool = false
    var coloredButtonM2 : Bool = false
    
    let wordsToPresent = ["DRINK","APPLE","EARLY","HABIT","LABEL"]
    
    var randomNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSubmitWord.isEnabled = false
        
        disableTextFields()
        
        randomNumber = Int.random(in: 1..<5)
        
        randomWord = wordsToPresent[randomNumber]
        //randomWord = "DRINK"
        print(randomWord)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        numberFocused = 11
        textField11.becomeFirstResponder()
        textField11.layer.borderWidth = 2
        
    }

    // Evaluate the word after submitting it
    @IBAction func buttonSubmitWordClicked(_ sender: UIButton) {
        buttonSubmitWord.isEnabled = false
        
        buttonReset()
        CheckTheWord()
        
        if(correctGuess){
            // Alert the user that he won
            //print("You won the game!")
            let alert = UIAlertController(title: "Winner!", message: "Congratulations.You won the game.", preferredStyle: .alert)
                
                let okButton = UIAlertAction(title: "Play Again", style: .default) { _ in
                    self.resetGame()
                                }
                let quitButton = UIAlertAction(title: "Quit", style: .default) { _ in
                    UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
                            }
                alert.addAction(okButton)
                alert.addAction(quitButton)
            self.show(alert, sender: nil)
            numberFocused = 0
            
        } else{
            
            if(guessNumber==6){
                //print("You lost the game")
                //If the user want, reset the game
                let alert = UIAlertController(title: "Looser!", message: "You lost the game. Correct word was '\(randomWord)'", preferredStyle: .alert)
                    
                    let okButton = UIAlertAction(title: "Try Again", style: .default) { _ in
                        self.resetGame()
                                    }
                    let quitButton = UIAlertAction(title: "Quit", style: .default) { _ in
                        UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
                                }
                    alert.addAction(okButton)
                    alert.addAction(quitButton)
                self.show(alert, sender: nil)
            } else{
                changeFocus()
            }
        }
        
    }
    
    func CheckTheWord(){
        // Check the word
        if(guessNumber==1){
            
            guessedWord = "\(textField11.text!)\(textField12.text!)\(textField13.text!)\(textField14.text!)\(textField15.text!)"
            
        } else if(guessNumber==2){
            guessedWord = "\(textField21.text!)\(textField22.text!)\(textField23.text!)\(textField24.text!)\(textField25.text!)"
        } else if(guessNumber==3){
            guessedWord = "\(textField31.text!)\(textField32.text!)\(textField33.text!)\(textField34.text!)\(textField35.text!)"
        } else if(guessNumber==4){
            guessedWord = "\(textField41.text!)\(textField42.text!)\(textField43.text!)\(textField44.text!)\(textField45.text!)"
        } else if(guessNumber==5){
            guessedWord = "\(textField51.text!)\(textField52.text!)\(textField53.text!)\(textField54.text!)\(textField55.text!)"
        } else{
            guessedWord = "\(textField61.text!)\(textField62.text!)\(textField63.text!)\(textField64.text!)\(textField65.text!)"
        }
        
        //check whether word is known
        let correct = isCorrectWord(word: guessedWord.lowercased())
        
        if(correct){
            if(guessedWord==randomWord){
                correctGuess = true
                if(guessNumber==1){
                    textField11.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField11.textColor = UIColor.white
                    textField12.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField12.textColor = UIColor.white
                    textField13.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField13.textColor = UIColor.white
                    textField14.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField14.textColor = UIColor.white
                    textField15.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField15.textColor = UIColor.white
                } else if(guessNumber==2){
                    textField21.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField21.textColor = UIColor.white
                    textField22.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField22.textColor = UIColor.white
                    textField23.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField23.textColor = UIColor.white
                    textField24.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField24.textColor = UIColor.white
                    textField25.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField25.textColor = UIColor.white
                } else if(guessNumber==3){
                    textField31.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField31.textColor = UIColor.white
                    textField32.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField32.textColor = UIColor.white
                    textField33.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField33.textColor = UIColor.white
                    textField34.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField34.textColor = UIColor.white
                    textField35.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField35.textColor = UIColor.white
                } else if(guessNumber==4){
                    textField41.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField41.textColor = UIColor.white
                    textField42.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField42.textColor = UIColor.white
                    textField43.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField43.textColor = UIColor.white
                    textField44.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField44.textColor = UIColor.white
                    textField45.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField45.textColor = UIColor.white
                } else if(guessNumber==5){
                    textField51.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField51.textColor = UIColor.white
                    textField52.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField52.textColor = UIColor.white
                    textField53.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField53.textColor = UIColor.white
                    textField54.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField54.textColor = UIColor.white
                    textField55.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField55.textColor = UIColor.white
                } else{
                    textField61.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField61.textColor = UIColor.white
                    textField62.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField62.textColor = UIColor.white
                    textField63.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField63.textColor = UIColor.white
                    textField64.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField64.textColor = UIColor.white
                    textField65.layer.backgroundColor = UIColor.systemBlue.cgColor
                    textField65.textColor = UIColor.white
                }
            } else{
                // Color coding of letters
                if(guessNumber==1){
                    if(randomWord=="DRINK"){
                        if(textField11.text!=="D"){
                            textField11.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField11.textColor = UIColor.white
                            buttonD.backgroundColor = UIColor.blue
                            //buttonD.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField11.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField11.textColor = UIColor.white
                            if(textField11.text!=="R"){
                                coloredButtonR = true
                                textField11.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField11.text!, color: "orange")
                            } else if(textField11.text!=="I"){
                                coloredButtonI = true
                                textField11.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField11.text!, color: "orange")
                            } else if(textField11.text!=="N"){
                                coloredButtonN = true
                                textField11.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField11.text!, color: "orange")
                            } else if(textField11.text!=="K"){
                                coloredButtonK = true
                                textField11.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField11.text!, color: "orange")
                            } else{
                                textField11.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField11.text!, color: "grey")
                            }
                            
                        }
                        if(textField12.text!=="R"){
                            textField12.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField12.textColor = UIColor.white
                            buttonR.backgroundColor = UIColor.blue
                            //buttonR.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField12.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField12.textColor = UIColor.white
                            if(textField12.text!=="D"){
                                coloredButtonD = true
                                textField12.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField12.text!, color: "orange")
                            } else if(textField12.text!=="I"){
                                coloredButtonI = true
                                textField12.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField12.text!, color: "orange")
                            } else if(textField12.text!=="N"){
                                coloredButtonN = true
                                textField12.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField12.text!, color: "orange")
                            } else if(textField12.text!=="K"){
                                coloredButtonK = true
                                textField12.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField12.text!, color: "orange")
                            } else{
                                textField12.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField12.text!, color: "grey")
                            }
                        }
                        if(textField13.text!=="I"){
                            textField13.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField13.textColor = UIColor.white
                            buttonI.backgroundColor = UIColor.blue
                            //buttonI.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField13.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField13.textColor = UIColor.white
                            if(textField13.text!=="D"){
                                coloredButtonD = true
                                textField13.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField13.text!, color: "orange")
                            } else if(textField13.text!=="R"){
                                coloredButtonR = true
                                textField13.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField13.text!, color: "orange")
                            } else if(textField13.text!=="N"){
                                coloredButtonN = true
                                textField13.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField13.text!, color: "orange")
                            } else if(textField13.text!=="K"){
                                coloredButtonK = true
                                textField13.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField13.text!, color: "orange")
                            } else{
                                textField13.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField13.text!, color: "grey")
                            }
                        }
                        if(textField14.text!=="N"){
                            textField14.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField14.textColor = UIColor.white
                            buttonN.backgroundColor = UIColor.blue
                            //buttonN.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField14.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField14.textColor = UIColor.white
                            if(textField14.text!=="D"){
                                coloredButtonD = true
                                textField14.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField14.text!, color: "orange")
                            } else if(textField13.text!=="R"){
                                coloredButtonR = true
                                textField14.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField14.text!, color: "orange")
                            } else if(textField14.text!=="I"){
                                coloredButtonI = true
                                textField14.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField14.text!, color: "orange")
                            } else if(textField14.text!=="K"){
                                coloredButtonK = true
                                textField14.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField14.text!, color: "orange")
                            } else{
                                textField14.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField14.text!, color: "grey")
                            }
                        }
                        if(textField15.text!=="K"){
                            textField15.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField15.textColor = UIColor.white
                            buttonK.backgroundColor = UIColor.blue
                            //buttonK.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField15.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField15.textColor = UIColor.white
                            if(textField15.text!=="D"){
                                coloredButtonD = true
                                textField15.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField15.text!, color: "orange")
                            } else if(textField15.text!=="R"){
                                coloredButtonR = true
                                textField15.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField15.text!, color: "orange")
                            } else if(textField15.text!=="I"){
                                coloredButtonI = true
                                textField15.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField15.text!, color: "orange")
                            } else if(textField15.text!=="N"){
                                coloredButtonN = true
                                textField15.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField15.text!, color: "orange")
                            } else{
                                textField15.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField15.text!, color: "grey")
                            }
                        }
                    } else if(randomWord=="APPLE"){
                        if(textField11.text!=="A"){
                            textField11.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField11.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField11.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField11.textColor = UIColor.white
                            if(textField11.text!=="P"){
                                coloredButtonP = true
                                textField11.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField11.text!, color: "orange")
                            } else if(textField11.text!=="P"){
                                coloredButtonP = true
                                textField11.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField11.text!, color: "orange")
                            } else if(textField11.text!=="L"){
                                coloredButtonL = true
                                textField11.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField11.text!, color: "orange")
                            } else if(textField11.text!=="E"){
                                coloredButtonE = true
                                textField11.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField11.text!, color: "orange")
                            } else{
                                textField11.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField11.text!, color: "grey")
                            }
                        }
                        if(textField12.text!=="P"){
                            textField12.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField12.textColor = UIColor.white
                            buttonP.backgroundColor = UIColor.blue
                            //buttonP.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField12.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField12.textColor = UIColor.white
                            if(textField12.text!=="A"){
                                coloredButtonA = true
                                textField12.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField12.text!, color: "orange")
                            } else if(textField12.text!=="P"){
                                coloredButtonP = true
                                textField12.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField12.text!, color: "orange")
                            } else if(textField12.text!=="L"){
                                coloredButtonL = true
                                textField12.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField12.text!, color: "orange")
                            } else if(textField12.text!=="E"){
                                coloredButtonE = true
                                textField12.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField12.text!, color: "orange")
                            } else{
                                textField12.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField12.text!, color: "grey")
                            }
                        }
                        if(textField13.text!=="P"){
                            textField13.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField13.textColor = UIColor.white
                            buttonP.backgroundColor = UIColor.blue
                            //buttonP.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField13.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField13.textColor = UIColor.white
                            if(textField13.text!=="A"){
                                coloredButtonA = true
                                textField13.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField13.text!, color: "orange")
                            } else if(textField13.text!=="P"){
                                coloredButtonP = true
                                textField13.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField13.text!, color: "orange")
                            } else if(textField13.text!=="L"){
                                coloredButtonL = true
                                textField13.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField13.text!, color: "orange")
                            } else if(textField13.text!=="E"){
                                coloredButtonE = true
                                textField13.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField13.text!, color: "orange")
                            } else{
                                textField13.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField13.text!, color: "grey")
                            }
                        }
                        if(textField14.text!=="L"){
                            textField14.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField14.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField14.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField14.textColor = UIColor.white
                            if(textField14.text!=="A"){
                                coloredButtonA = true
                                textField14.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField14.text!, color: "orange")
                            } else if(textField14.text!=="P"){
                                coloredButtonP = true
                                textField14.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField14.text!, color: "orange")
                            } else if(textField14.text!=="P"){
                                coloredButtonP = true
                                textField14.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField14.text!, color: "orange")
                            } else if(textField14.text!=="E"){
                                coloredButtonE = true
                                textField14.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField14.text!, color: "orange")
                            } else{
                                textField14.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField14.text!, color: "grey")
                            }
                        }
                        if(textField15.text!=="E"){
                            textField15.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField15.textColor = UIColor.white
                            buttonE.backgroundColor = UIColor.blue
                            //buttonE.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField15.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField15.textColor = UIColor.white
                            if(textField15.text!=="A"){
                                coloredButtonA = true
                                textField15.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField15.text!, color: "orange")
                            } else if(textField15.text!=="P"){
                                coloredButtonP = true
                                textField15.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField15.text!, color: "orange")
                            } else if(textField15.text!=="P"){
                                coloredButtonP = true
                                textField15.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField15.text!, color: "orange")
                            } else if(textField15.text!=="L"){
                                coloredButtonL = true
                                textField15.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField15.text!, color: "orange")
                            } else{
                                textField15.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField15.text!, color: "grey")
                            }
                        }
                    } else if(randomWord=="EARLY"){
                        if(textField11.text!=="E"){
                            textField11.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField11.textColor = UIColor.white
                            buttonE.backgroundColor = UIColor.blue
                            //buttonE.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField11.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField11.textColor = UIColor.white
                            if(textField11.text!=="A"){
                                coloredButtonA = true
                                textField11.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField11.text!, color: "orange")
                            } else if(textField11.text!=="R"){
                                coloredButtonR = true
                                textField11.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField11.text!, color: "orange")
                            } else if(textField11.text!=="L"){
                                coloredButtonL = true
                                textField11.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField11.text!, color: "orange")
                            } else if(textField11.text!=="Y"){
                                coloredButtonY = true
                                textField11.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField11.text!, color: "orange")
                            } else{
                                textField11.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField11.text!, color: "grey")
                            }
                        }
                        if(textField12.text!=="A"){
                            textField12.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField12.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField12.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField12.textColor = UIColor.white
                            if(textField12.text!=="E"){
                                coloredButtonE = true
                                textField12.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField12.text!, color: "orange")
                            } else if(textField12.text!=="R"){
                                coloredButtonR = true
                                textField12.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField12.text!, color: "orange")
                            } else if(textField12.text!=="L"){
                                coloredButtonL = true
                                textField12.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField12.text!, color: "orange")
                            } else if(textField12.text!=="Y"){
                                coloredButtonY = true
                                textField12.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField12.text!, color: "orange")
                            } else{
                                textField12.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField12.text!, color: "grey")
                            }
                        }
                        if(textField13.text!=="R"){
                            textField13.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField13.textColor = UIColor.white
                            buttonR.backgroundColor = UIColor.blue
                            //buttonR.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField13.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField13.textColor = UIColor.white
                            if(textField13.text!=="E"){
                                coloredButtonE = true
                                textField13.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField13.text!, color: "orange")
                            } else if(textField13.text!=="A"){
                                coloredButtonA = true
                                textField13.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField13.text!, color: "orange")
                            } else if(textField13.text!=="L"){
                                coloredButtonL = true
                                textField13.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField13.text!, color: "orange")
                            } else if(textField13.text!=="Y"){
                                coloredButtonY = true
                                textField13.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField13.text!, color: "orange")
                            } else{
                                textField13.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField13.text!, color: "grey")
                            }
                        }
                        if(textField14.text!=="L"){
                            textField14.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField14.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField14.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField14.textColor = UIColor.white
                            if(textField14.text!=="E"){
                                coloredButtonE = true
                                textField14.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField14.text!, color: "orange")
                            } else if(textField14.text!=="A"){
                                coloredButtonA = true
                                textField14.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField14.text!, color: "orange")
                            } else if(textField14.text!=="R"){
                                coloredButtonR = true
                                textField14.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField14.text!, color: "orange")
                            } else if(textField14.text!=="Y"){
                                coloredButtonY = true
                                textField14.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField14.text!, color: "orange")
                            } else{
                                textField14.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField14.text!, color: "grey")
                            }
                        }
                        if(textField15.text!=="Y"){
                            textField15.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField15.textColor = UIColor.white
                            buttonY.backgroundColor = UIColor.blue
                            //buttonY.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField15.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField15.textColor = UIColor.white
                            if(textField15.text!=="E"){
                                coloredButtonE = true
                                textField15.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField15.text!, color: "orange")
                            } else if(textField15.text!=="A"){
                                coloredButtonA = true
                                textField15.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField15.text!, color: "orange")
                            } else if(textField15.text!=="R"){
                                coloredButtonR = true
                                textField15.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField15.text!, color: "orange")
                            } else if(textField15.text!=="L"){
                                coloredButtonL = true
                                textField15.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField15.text!, color: "orange")
                            } else{
                                textField15.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField15.text!, color: "grey")
                            }
                        }
                    } else if(randomWord=="HABIT"){
                        if(textField11.text!=="H"){
                            textField11.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField11.textColor = UIColor.white
                            buttonH.backgroundColor = UIColor.blue
                            //buttonH.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField11.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField11.textColor = UIColor.white
                            if(textField11.text!=="A"){
                                coloredButtonA = true
                                textField11.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField11.text!, color: "orange")
                            } else if(textField11.text!=="B"){
                                coloredButtonB = true
                                textField11.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField11.text!, color: "orange")
                            } else if(textField11.text!=="I"){
                                coloredButtonI = true
                                textField11.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField11.text!, color: "orange")
                            } else if(textField11.text!=="T"){
                                coloredButtonT = true
                                textField11.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField11.text!, color: "orange")
                            } else{
                                textField11.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField11.text!, color: "grey")
                            }
                        }
                        if(textField12.text!=="A"){
                            textField12.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField12.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField12.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField12.textColor = UIColor.white
                            if(textField12.text!=="H"){
                                coloredButtonH = true
                                textField12.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField12.text!, color: "orange")
                            } else if(textField12.text!=="B"){
                                coloredButtonB = true
                                textField12.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField12.text!, color: "orange")
                            } else if(textField12.text!=="I"){
                                coloredButtonI = true
                                textField12.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField12.text!, color: "orange")
                            } else if(textField12.text!=="T"){
                                coloredButtonT = true
                                textField12.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField12.text!, color: "orange")
                            } else{
                                textField12.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField12.text!, color: "grey")
                            }
                        }
                        if(textField13.text!=="B"){
                            textField13.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField13.textColor = UIColor.white
                            buttonB.backgroundColor = UIColor.blue
                            //buttonB.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField13.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField13.textColor = UIColor.white
                            if(textField13.text!=="H"){
                                coloredButtonH = true
                                textField13.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField13.text!, color: "orange")
                            } else if(textField13.text!=="A"){
                                coloredButtonA = true
                                textField13.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField13.text!, color: "orange")
                            } else if(textField13.text!=="I"){
                                coloredButtonI = true
                                textField13.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField13.text!, color: "orange")
                            } else if(textField13.text!=="T"){
                                coloredButtonT = true
                                textField13.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField13.text!, color: "orange")
                            } else{
                                textField13.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField13.text!, color: "grey")
                            }
                        }
                        if(textField14.text!=="I"){
                            textField14.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField14.textColor = UIColor.white
                            buttonI.backgroundColor = UIColor.blue
                            //buttonI.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField14.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField14.textColor = UIColor.white
                            if(textField14.text!=="H"){
                                coloredButtonH = true
                                textField14.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField14.text!, color: "orange")
                            } else if(textField14.text!=="A"){
                                coloredButtonA = true
                                textField14.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField14.text!, color: "orange")
                            } else if(textField14.text!=="B"){
                                coloredButtonB = true
                                textField14.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField14.text!, color: "orange")
                            } else if(textField14.text!=="T"){
                                coloredButtonT = true
                                textField14.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField14.text!, color: "orange")
                            } else{
                                textField14.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField14.text!, color: "grey")
                            }
                        }
                        if(textField15.text!=="T"){
                            textField15.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField15.textColor = UIColor.white
                            buttonT.backgroundColor = UIColor.blue
                            //buttonT.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField15.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField15.textColor = UIColor.white
                            if(textField15.text!=="H"){
                                coloredButtonH = true
                                textField15.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField15.text!, color: "orange")
                            } else if(textField15.text!=="A"){
                                coloredButtonA = true
                                textField15.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField15.text!, color: "orange")
                            } else if(textField15.text!=="B"){
                                coloredButtonB = true
                                textField15.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField15.text!, color: "orange")
                            } else if(textField15.text!=="I"){
                                coloredButtonI = true
                                textField15.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField15.text!, color: "orange")
                            } else{
                                textField15.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField15.text!, color: "grey")
                            }
                        }
                    } else {
                        if(textField11.text!=="L"){
                            textField11.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField11.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField11.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField11.textColor = UIColor.white
                            if(textField11.text!=="A"){
                                coloredButtonA = true
                                textField11.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField11.text!, color: "orange")
                            } else if(textField11.text!=="B"){
                                coloredButtonB = true
                                textField11.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField11.text!, color: "orange")
                            } else if(textField11.text!=="E"){
                                coloredButtonE = true
                                textField11.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField11.text!, color: "orange")
                            } else if(textField11.text!=="L"){
                                coloredButtonL = true
                                textField11.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField11.text!, color: "orange")
                            } else{
                                textField11.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField11.text!, color: "grey")
                            }
                        }
                        if(textField12.text!=="A"){
                            textField12.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField12.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField12.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField12.textColor = UIColor.white
                            if(textField12.text!=="L"){
                                coloredButtonL = true
                                textField12.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField12.text!, color: "orange")
                            } else if(textField12.text!=="B"){
                                coloredButtonB = true
                                textField12.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField12.text!, color: "orange")
                            } else if(textField12.text!=="E"){
                                coloredButtonE = true
                                textField12.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField12.text!, color: "orange")
                            } else if(textField12.text!=="L"){
                                coloredButtonL = true
                                textField12.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField12.text!, color: "orange")
                            } else{
                                textField12.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField12.text!, color: "grey")
                            }
                        }
                        if(textField13.text!=="B"){
                            textField13.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField13.textColor = UIColor.white
                            buttonB.backgroundColor = UIColor.blue
                            //buttonB.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField13.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField13.textColor = UIColor.white
                            if(textField13.text!=="L"){
                                coloredButtonL = true
                                textField13.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField13.text!, color: "orange")
                            } else if(textField13.text!=="A"){
                                coloredButtonA = true
                                textField13.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField13.text!, color: "orange")
                            } else if(textField13.text!=="E"){
                                coloredButtonE = true
                                textField13.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField13.text!, color: "orange")
                            } else if(textField13.text!=="L"){
                                coloredButtonL = true
                                textField13.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField13.text!, color: "orange")
                            } else{
                                textField13.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField13.text!, color: "grey")
                            }
                        }
                        if(textField14.text!=="E"){
                            textField14.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField14.textColor = UIColor.white
                            buttonE.backgroundColor = UIColor.blue
                            //buttonE.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField14.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField14.textColor = UIColor.white
                            if(textField14.text!=="L"){
                                coloredButtonL = true
                                textField14.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField14.text!, color: "orange")
                            } else if(textField14.text!=="A"){
                                coloredButtonA = true
                                textField14.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField14.text!, color: "orange")
                            } else if(textField14.text!=="B"){
                                coloredButtonB = true
                                textField14.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField14.text!, color: "orange")
                            } else if(textField14.text!=="L"){
                                coloredButtonL = true
                                textField14.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField14.text!, color: "orange")
                            } else{
                                textField14.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField14.text!, color: "grey")
                            }
                        }
                        if(textField15.text!=="L"){
                            textField15.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField15.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField15.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField15.textColor = UIColor.white
                            if(textField15.text!=="E"){
                                coloredButtonE = true
                                textField15.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField15.text!, color: "orange")
                            } else if(textField15.text!=="A"){
                                coloredButtonA = true
                                textField15.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField15.text!, color: "orange")
                            } else if(textField15.text!=="B"){
                                coloredButtonB = true
                                textField15.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField15.text!, color: "orange")
                            } else if(textField15.text!=="L"){
                                coloredButtonL = true
                                textField15.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField15.text!, color: "orange")
                            } else{
                                textField15.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField14.text!, color: "grey")
                            }
                        }
                    }
                    
                } else if(guessNumber==2){
                    if(randomWord=="DRINK"){
                        if(textField21.text!=="D"){
                            textField21.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField21.textColor = UIColor.white
                            buttonD.backgroundColor = UIColor.blue
                            //buttonD.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField21.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField21.textColor = UIColor.white
                            if(textField21.text!=="K"){
                                coloredButtonK = true
                                textField21.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField21.text!, color: "orange")
                            } else if(textField21.text!=="R"){
                                coloredButtonR = true
                                textField21.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField21.text!, color: "orange")
                            } else if(textField21.text!=="I"){
                                coloredButtonI = true
                                textField21.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField21.text!, color: "orange")
                            } else if(textField21.text!=="N"){
                                coloredButtonN = true
                                textField21.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField21.text!, color: "orange")
                            } else{
                                textField21.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField21.text!, color: "grey")
                            }
                        }
                        if(textField22.text!=="R"){
                            textField22.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField22.textColor = UIColor.white
                            buttonR.backgroundColor = UIColor.blue
                            //buttonR.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField22.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField22.textColor = UIColor.white
                            if(textField22.text!=="K"){
                                coloredButtonK = true
                                textField22.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField22.text!, color: "orange")
                            } else if(textField22.text!=="D"){
                                coloredButtonD = true
                                textField22.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField22.text!, color: "orange")
                            } else if(textField22.text!=="I"){
                                coloredButtonI = true
                                textField22.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField22.text!, color: "orange")
                            } else if(textField22.text!=="N"){
                                coloredButtonN = true
                                textField22.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField22.text!, color: "orange")
                            } else{
                                textField22.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField22.text!, color: "grey")
                            }
                        }
                        if(textField23.text!=="I"){
                            textField23.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField23.textColor = UIColor.white
                            buttonI.backgroundColor = UIColor.blue
                            //buttonI.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField23.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField23.textColor = UIColor.white
                            if(textField23.text!=="K"){
                                coloredButtonK = true
                                textField23.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField23.text!, color: "orange")
                            } else if(textField23.text!=="D"){
                                coloredButtonD = true
                                textField23.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField23.text!, color: "orange")
                            } else if(textField23.text!=="R"){
                                coloredButtonR = true
                                textField23.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField23.text!, color: "orange")
                            } else if(textField23.text!=="N"){
                                coloredButtonN = true
                                textField23.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField23.text!, color: "orange")
                            } else{
                                textField23.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField23.text!, color: "grey")
                            }
                        }
                        if(textField24.text!=="N"){
                            textField24.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField24.textColor = UIColor.white
                            buttonN.backgroundColor = UIColor.blue
                            //buttonN.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField24.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField24.textColor = UIColor.white
                            if(textField24.text!=="K"){
                                coloredButtonK = true
                                textField24.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField24.text!, color: "orange")
                            } else if(textField24.text!=="D"){
                                coloredButtonD = true
                                textField24.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField24.text!, color: "orange")
                            } else if(textField24.text!=="R"){
                                coloredButtonR = true
                                textField24.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField24.text!, color: "orange")
                            } else if(textField24.text!=="I"){
                                coloredButtonI = true
                                textField24.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField24.text!, color: "orange")
                            } else{
                                textField24.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField24.text!, color: "grey")
                            }
                        }
                        if(textField25.text!=="K"){
                            textField25.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField25.textColor = UIColor.white
                            buttonK.backgroundColor = UIColor.blue
                            //buttonK.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField25.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField25.textColor = UIColor.white
                            if(textField25.text!=="N"){
                                coloredButtonN = true
                                textField25.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField25.text!, color: "orange")
                            } else if(textField25.text!=="D"){
                                coloredButtonD = true
                                textField25.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField25.text!, color: "orange")
                            } else if(textField25.text!=="R"){
                                coloredButtonR = true
                                textField25.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField25.text!, color: "orange")
                            } else if(textField25.text!=="I"){
                                coloredButtonI = true
                                textField25.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField25.text!, color: "orange")
                            } else{
                                textField25.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField25.text!, color: "grey")
                            }
                        }
                    } else if(randomWord=="APPLE"){
                        if(textField21.text!=="A"){
                            textField21.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField21.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField21.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField21.textColor = UIColor.white
                            if(textField21.text!=="P"){
                                coloredButtonP = true
                                textField21.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField21.text!, color: "orange")
                            } else if(textField21.text!=="P"){
                                coloredButtonP = true
                                textField21.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField21.text!, color: "orange")
                            } else if(textField21.text!=="L"){
                                coloredButtonL = true
                                textField21.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField21.text!, color: "orange")
                            } else if(textField21.text!=="E"){
                                coloredButtonE = true
                                textField21.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField21.text!, color: "orange")
                            } else{
                                textField21.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField21.text!, color: "grey")
                            }
                        }
                        if(textField22.text!=="P"){
                            textField22.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField22.textColor = UIColor.white
                            buttonP.backgroundColor = UIColor.blue
                            //buttonP.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField22.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField22.textColor = UIColor.white
                            if(textField22.text!=="A"){
                                coloredButtonA = true
                                textField22.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField22.text!, color: "orange")
                            } else if(textField22.text!=="P"){
                                coloredButtonP = true
                                textField22.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField22.text!, color: "orange")
                            } else if(textField22.text!=="L"){
                                coloredButtonL = true
                                textField22.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField22.text!, color: "orange")
                            } else if(textField22.text!=="E"){
                                coloredButtonE = true
                                textField22.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField22.text!, color: "orange")
                            } else{
                                textField22.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField22.text!, color: "grey")
                            }
                        }
                        if(textField23.text!=="P"){
                            textField23.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField23.textColor = UIColor.white
                            buttonP.backgroundColor = UIColor.blue
                            //buttonP.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField23.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField23.textColor = UIColor.white
                            if(textField23.text!=="A"){
                                coloredButtonA = true
                                textField23.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField23.text!, color: "orange")
                            } else if(textField23.text!=="P"){
                                coloredButtonP = true
                                textField23.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField23.text!, color: "orange")
                            } else if(textField23.text!=="L"){
                                coloredButtonL = true
                                textField23.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField23.text!, color: "orange")
                            } else if(textField23.text!=="E"){
                                coloredButtonE = true
                                textField23.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField23.text!, color: "orange")
                            } else{
                                textField23.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField23.text!, color: "grey")
                            }
                        }
                        if(textField24.text!=="L"){
                            textField24.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField24.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField24.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField24.textColor = UIColor.white
                            if(textField24.text!=="A"){
                                coloredButtonA = true
                                textField24.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField24.text!, color: "orange")
                            } else if(textField24.text!=="P"){
                                coloredButtonP = true
                                textField24.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField24.text!, color: "orange")
                            } else if(textField24.text!=="P"){
                                coloredButtonP = true
                                textField24.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField24.text!, color: "orange")
                            } else if(textField24.text!=="E"){
                                coloredButtonE = true
                                textField24.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField24.text!, color: "orange")
                            } else{
                                textField24.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField24.text!, color: "grey")
                            }
                        }
                        if(textField25.text!=="E"){
                            textField25.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField25.textColor = UIColor.white
                            buttonE.backgroundColor = UIColor.blue
                            //buttonE.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField25.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField25.textColor = UIColor.white
                            if(textField25.text!=="A"){
                                coloredButtonA = true
                                textField25.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField25.text!, color: "orange")
                            } else if(textField25.text!=="P"){
                                coloredButtonP = true
                                textField25.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField25.text!, color: "orange")
                            } else if(textField25.text!=="P"){
                                coloredButtonP = true
                                textField25.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField25.text!, color: "orange")
                            } else if(textField25.text!=="L"){
                                coloredButtonL = true
                                textField25.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField25.text!, color: "orange")
                            } else{
                                textField25.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField25.text!, color: "grey")
                            }
                        }
                    } else if(randomWord=="EARLY"){
                        if(textField21.text!=="E"){
                            textField21.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField21.textColor = UIColor.white
                            buttonE.backgroundColor = UIColor.blue
                            //buttonE.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField21.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField21.textColor = UIColor.white
                            if(textField21.text!=="A"){
                                coloredButtonA = true
                                textField21.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField21.text!, color: "orange")
                            } else if(textField21.text!=="R"){
                                coloredButtonR = true
                                textField21.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField21.text!, color: "orange")
                            } else if(textField21.text!=="Y"){
                                coloredButtonY = true
                                textField21.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField21.text!, color: "orange")
                            } else if(textField21.text!=="L"){
                                coloredButtonL = true
                                textField21.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField21.text!, color: "orange")
                            } else{
                                textField21.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField21.text!, color: "grey")
                            }
                        }
                        if(textField22.text!=="A"){
                            textField22.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField22.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField22.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField22.textColor = UIColor.white
                            if(textField22.text!=="E"){
                                coloredButtonE = true
                                textField22.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField22.text!, color: "orange")
                            } else if(textField22.text!=="R"){
                                coloredButtonR = true
                                textField22.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField22.text!, color: "orange")
                            } else if(textField22.text!=="Y"){
                                coloredButtonY = true
                                textField22.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField22.text!, color: "orange")
                            } else if(textField22.text!=="L"){
                                coloredButtonL = true
                                textField22.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField22.text!, color: "orange")
                            } else{
                                textField22.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField22.text!, color: "grey")
                            }
                        }
                        if(textField23.text!=="R"){
                            textField23.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField23.textColor = UIColor.white
                            buttonR.backgroundColor = UIColor.blue
                            //buttonR.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField23.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField23.textColor = UIColor.white
                            if(textField23.text!=="E"){
                                coloredButtonE = true
                                textField23.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField23.text!, color: "orange")
                            } else if(textField23.text!=="A"){
                                coloredButtonA = true
                                textField23.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField23.text!, color: "orange")
                            } else if(textField23.text!=="Y"){
                                coloredButtonY = true
                                textField23.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField23.text!, color: "orange")
                            } else if(textField23.text!=="L"){
                                coloredButtonL = true
                                textField23.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField23.text!, color: "orange")
                            } else{
                                textField23.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField23.text!, color: "grey")
                            }
                        }
                        if(textField24.text!=="L"){
                            textField24.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField24.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField24.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField24.textColor = UIColor.white
                            if(textField24.text!=="E"){
                                coloredButtonE = true
                                textField24.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField24.text!, color: "orange")
                            } else if(textField24.text!=="A"){
                                coloredButtonA = true
                                textField24.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField24.text!, color: "orange")
                            } else if(textField24.text!=="Y"){
                                coloredButtonY = true
                                textField24.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField24.text!, color: "orange")
                            } else if(textField24.text!=="R"){
                                coloredButtonR = true
                                textField24.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField24.text!, color: "orange")
                            } else{
                                textField24.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField24.text!, color: "grey")
                            }
                        }
                        if(textField25.text!=="Y"){
                            textField25.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField25.textColor = UIColor.white
                            buttonY.backgroundColor = UIColor.blue
                            //buttonY.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField25.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField25.textColor = UIColor.white
                            if(textField25.text!=="E"){
                                coloredButtonE = true
                                textField25.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField25.text!, color: "orange")
                            } else if(textField25.text!=="A"){
                                coloredButtonA = true
                                textField25.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField25.text!, color: "orange")
                            } else if(textField25.text!=="L"){
                                coloredButtonL = true
                                textField25.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField25.text!, color: "orange")
                            } else if(textField25.text!=="R"){
                                coloredButtonR = true
                                textField25.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField25.text!, color: "orange")
                            } else{
                                textField25.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField25.text!, color: "grey")
                            }
                        }
                    } else if(randomWord=="HABIT"){
                        if(textField21.text!=="H"){
                            textField21.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField21.textColor = UIColor.white
                            buttonH.backgroundColor = UIColor.blue
                            //buttonH.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField21.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField21.textColor = UIColor.white
                            if(textField21.text!=="A"){
                                coloredButtonA = true
                                textField21.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField21.text!, color: "orange")
                            } else if(textField21.text!=="B"){
                                coloredButtonB = true
                                textField21.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField21.text!, color: "orange")
                            } else if(textField21.text!=="I"){
                                coloredButtonI = true
                                textField21.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField21.text!, color: "orange")
                            } else if(textField21.text!=="T"){
                                coloredButtonT = true
                                textField21.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField21.text!, color: "orange")
                            } else{
                                textField21.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField21.text!, color: "grey")
                            }
                        }
                        if(textField22.text!=="A"){
                            textField22.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField22.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField22.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField22.textColor = UIColor.white
                            if(textField22.text!=="H"){
                                coloredButtonH = true
                                textField22.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField22.text!, color: "orange")
                            } else if(textField22.text!=="B"){
                                coloredButtonB = true
                                textField22.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField22.text!, color: "orange")
                            } else if(textField22.text!=="I"){
                                coloredButtonI = true
                                textField22.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField22.text!, color: "orange")
                            } else if(textField22.text!=="T"){
                                coloredButtonT = true
                                textField22.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField22.text!, color: "orange")
                            } else{
                                textField22.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField22.text!, color: "grey")
                            }
                        }
                        if(textField23.text!=="B"){
                            textField23.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField23.textColor = UIColor.white
                            buttonB.backgroundColor = UIColor.blue
                            //buttonB.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField23.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField23.textColor = UIColor.white
                            if(textField23.text!=="H"){
                                coloredButtonH = true
                                textField23.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField23.text!, color: "orange")
                            } else if(textField23.text!=="A"){
                                coloredButtonA = true
                                textField23.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField23.text!, color: "orange")
                            } else if(textField23.text!=="I"){
                                coloredButtonI = true
                                textField23.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField23.text!, color: "orange")
                            } else if(textField23.text!=="T"){
                                coloredButtonT = true
                                textField23.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField23.text!, color: "orange")
                            } else{
                                textField23.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField23.text!, color: "grey")
                            }
                        }
                        if(textField24.text!=="I"){
                            textField24.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField24.textColor = UIColor.white
                            buttonI.backgroundColor = UIColor.blue
                            //buttonI.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField24.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField24.textColor = UIColor.white
                            if(textField24.text!=="H"){
                                coloredButtonH = true
                                textField24.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField24.text!, color: "orange")
                            } else if(textField24.text!=="A"){
                                coloredButtonA = true
                                textField24.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField24.text!, color: "orange")
                            } else if(textField24.text!=="B"){
                                coloredButtonB = true
                                textField24.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField24.text!, color: "orange")
                            } else if(textField24.text!=="T"){
                                coloredButtonT = true
                                textField24.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField24.text!, color: "orange")
                            } else{
                                textField24.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField24.text!, color: "grey")
                            }
                        }
                        if(textField25.text!=="T"){
                            textField25.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField25.textColor = UIColor.white
                            buttonT.backgroundColor = UIColor.blue
                            //buttonT.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField25.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField25.textColor = UIColor.white
                            if(textField25.text!=="H"){
                                coloredButtonH = true
                                textField25.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField25.text!, color: "orange")
                            } else if(textField25.text!=="A"){
                                coloredButtonA = true
                                textField25.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField25.text!, color: "orange")
                            } else if(textField25.text!=="B"){
                                coloredButtonB = true
                                textField25.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField25.text!, color: "orange")
                            } else if(textField25.text!=="I"){
                                coloredButtonI = true
                                textField25.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField25.text!, color: "orange")
                            } else{
                                textField25.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField25.text!, color: "grey")
                            }
                        }
                    } else {
                        if(textField21.text!=="L"){
                            textField21.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField21.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField21.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField21.textColor = UIColor.white
                            if(textField21.text!=="E"){
                                coloredButtonE = true
                                textField21.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField21.text!, color: "orange")
                            } else if(textField21.text!=="A"){
                                coloredButtonA = true
                                textField21.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField21.text!, color: "orange")
                            } else if(textField21.text!=="B"){
                                coloredButtonB = true
                                textField21.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField21.text!, color: "orange")
                            } else if(textField21.text!=="L"){
                                coloredButtonL = true
                                textField21.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField21.text!, color: "orange")
                            } else{
                                textField21.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField21.text!, color: "grey")
                            }
                        }
                        if(textField22.text!=="A"){
                            textField22.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField22.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField22.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField22.textColor = UIColor.white
                            if(textField22.text!=="E"){
                                coloredButtonE = true
                                textField22.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField22.text!, color: "orange")
                            } else if(textField22.text!=="L"){
                                coloredButtonL = true
                                textField22.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField22.text!, color: "orange")
                            } else if(textField22.text!=="B"){
                                coloredButtonB = true
                                textField22.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField22.text!, color: "orange")
                            } else if(textField22.text!=="L"){
                                coloredButtonL = true
                                textField22.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField22.text!, color: "orange")
                            } else{
                                textField22.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField22.text!, color: "grey")
                            }
                        }
                        if(textField23.text!=="B"){
                            textField23.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField23.textColor = UIColor.white
                            buttonB.backgroundColor = UIColor.blue
                            //buttonB.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField23.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField23.textColor = UIColor.white
                            if(textField23.text!=="E"){
                                coloredButtonE = true
                                textField23.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField23.text!, color: "orange")
                            } else if(textField23.text!=="L"){
                                coloredButtonL = true
                                textField23.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField23.text!, color: "orange")
                            } else if(textField23.text!=="A"){
                                coloredButtonA = true
                                textField23.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField23.text!, color: "orange")
                            } else if(textField23.text!=="L"){
                                coloredButtonL = true
                                textField23.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField23.text!, color: "orange")
                            } else{
                                textField23.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField23.text!, color: "grey")
                            }
                        }
                        if(textField24.text!=="E"){
                            textField24.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField24.textColor = UIColor.white
                            buttonE.backgroundColor = UIColor.blue
                            //buttonE.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField24.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField24.textColor = UIColor.white
                            if(textField24.text!=="B"){
                                coloredButtonB = true
                                textField24.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField24.text!, color: "orange")
                            } else if(textField24.text!=="L"){
                                coloredButtonL = true
                                textField24.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField24.text!, color: "orange")
                            } else if(textField24.text!=="A"){
                                coloredButtonA = true
                                textField24.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField24.text!, color: "orange")
                            } else if(textField24.text!=="L"){
                                coloredButtonL = true
                                textField24.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField24.text!, color: "orange")
                            } else{
                                textField24.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField24.text!, color: "grey")
                            }
                        }
                        if(textField25.text!=="L"){
                            textField25.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField25.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField25.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField25.textColor = UIColor.white
                            if(textField25.text!=="B"){
                                coloredButtonB = true
                                textField25.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField25.text!, color: "orange")
                            } else if(textField25.text!=="E"){
                                coloredButtonE = true
                                textField25.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField25.text!, color: "orange")
                            } else if(textField25.text!=="A"){
                                coloredButtonA = true
                                textField25.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField25.text!, color: "orange")
                            } else if(textField25.text!=="L"){
                                coloredButtonL = true
                                textField25.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField25.text!, color: "orange")
                            } else{
                                textField25.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField25.text!, color: "grey")
                            }
                        }
                    }
                    
                } else if(guessNumber==3){
                    if(randomWord=="DRINK"){
                        if(textField31.text!=="D"){
                            textField31.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField31.textColor = UIColor.white
                            buttonD.backgroundColor = UIColor.blue
                            //buttonD.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField31.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField31.textColor = UIColor.white
                            if(textField31.text!=="N"){
                                coloredButtonN = true
                                textField31.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField31.text!, color: "orange")
                            } else if(textField31.text!=="K"){
                                coloredButtonK = true
                                textField31.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField31.text!, color: "orange")
                            } else if(textField31.text!=="R"){
                                coloredButtonR = true
                                textField31.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField31.text!, color: "orange")
                            } else if(textField31.text!=="I"){
                                coloredButtonI = true
                                textField31.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField31.text!, color: "orange")
                            } else{
                                textField31.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField31.text!, color: "grey")
                            }
                        }
                        if(textField32.text!=="R"){
                            textField32.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField32.textColor = UIColor.white
                            buttonR.backgroundColor = UIColor.blue
                            //buttonR.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField32.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField32.textColor = UIColor.white
                            if(textField32.text!=="N"){
                                coloredButtonN = true
                                textField32.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField32.text!, color: "orange")
                            } else if(textField32.text!=="K"){
                                coloredButtonK = true
                                textField32.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField32.text!, color: "orange")
                            } else if(textField32.text!=="D"){
                                coloredButtonD = true
                                textField32.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField32.text!, color: "orange")
                            } else if(textField32.text!=="I"){
                                coloredButtonI = true
                                textField32.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField32.text!, color: "orange")
                            } else{
                                textField32.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField32.text!, color: "grey")
                            }
                        }
                        if(textField33.text!=="I"){
                            textField33.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField33.textColor = UIColor.white
                            buttonI.backgroundColor = UIColor.blue
                            //buttonI.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField33.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField33.textColor = UIColor.white
                            if(textField33.text!=="N"){
                                coloredButtonN = true
                                textField33.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField33.text!, color: "orange")
                            } else if(textField33.text!=="K"){
                                coloredButtonK = true
                                textField33.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField33.text!, color: "orange")
                            } else if(textField33.text!=="D"){
                                coloredButtonD = true
                                textField33.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField33.text!, color: "orange")
                            } else if(textField33.text!=="R"){
                                coloredButtonR = true
                                textField33.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField33.text!, color: "orange")
                            } else{
                                textField33.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField33.text!, color: "grey")
                            }
                        }
                        if(textField34.text!=="N"){
                            textField34.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField34.textColor = UIColor.white
                            buttonN.backgroundColor = UIColor.blue
                            //buttonN.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField34.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField34.textColor = UIColor.white
                            if(textField34.text!=="I"){
                                coloredButtonI = true
                                textField34.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField34.text!, color: "orange")
                            } else if(textField34.text!=="K"){
                                coloredButtonK = true
                                textField34.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField34.text!, color: "orange")
                            } else if(textField34.text!=="D"){
                                coloredButtonD = true
                                textField34.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField34.text!, color: "orange")
                            } else if(textField34.text!=="R"){
                                coloredButtonR = true
                                textField34.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField34.text!, color: "orange")
                            } else{
                                textField34.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField34.text!, color: "grey")
                            }
                        }
                        if(textField35.text!=="K"){
                            textField35.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField35.textColor = UIColor.white
                            buttonK.backgroundColor = UIColor.blue
                            //buttonK.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField35.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField35.textColor = UIColor.white
                            if(textField35.text!=="I"){
                                coloredButtonI = true
                                textField35.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField35.text!, color: "orange")
                            } else if(textField35.text!=="N"){
                                coloredButtonN = true
                                textField35.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField35.text!, color: "orange")
                            } else if(textField35.text!=="D"){
                                coloredButtonD = true
                                textField35.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField35.text!, color: "orange")
                            } else if(textField35.text!=="R"){
                                coloredButtonR = true
                                textField35.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField35.text!, color: "orange")
                            } else{
                                textField35.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField35.text!, color: "grey")
                            }
                        }
                    } else if(randomWord=="APPLE"){
                        if(textField31.text!=="A"){
                            textField31.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField31.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField31.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField31.textColor = UIColor.white
                            if(textField31.text!=="P"){
                                coloredButtonP = true
                                textField31.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField31.text!, color: "orange")
                            } else if(textField31.text!=="P"){
                                coloredButtonP = true
                                textField31.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField31.text!, color: "orange")
                            } else if(textField31.text!=="L"){
                                coloredButtonL = true
                                textField31.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField31.text!, color: "orange")
                            } else if(textField31.text!=="E"){
                                coloredButtonE = true
                                textField31.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField31.text!, color: "orange")
                            } else{
                                textField31.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField31.text!, color: "grey")
                            }
                        }
                        if(textField32.text!=="P"){
                            textField32.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField32.textColor = UIColor.white
                            buttonP.backgroundColor = UIColor.blue
                            //buttonP.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField32.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField32.textColor = UIColor.white
                            if(textField32.text!=="A"){
                                coloredButtonA = true
                                textField32.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField32.text!, color: "orange")
                            } else if(textField32.text!=="P"){
                                coloredButtonP = true
                                textField32.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField32.text!, color: "orange")
                            } else if(textField32.text!=="L"){
                                coloredButtonL = true
                                textField32.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField32.text!, color: "orange")
                            } else if(textField32.text!=="E"){
                                coloredButtonE = true
                                textField32.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField32.text!, color: "orange")
                            } else{
                                textField32.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField32.text!, color: "grey")
                            }
                        }
                        if(textField33.text!=="P"){
                            textField33.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField33.textColor = UIColor.white
                            buttonP.backgroundColor = UIColor.blue
                            //buttonP.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField33.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField33.textColor = UIColor.white
                            if(textField33.text!=="A"){
                                coloredButtonA = true
                                textField33.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField33.text!, color: "orange")
                            } else if(textField33.text!=="P"){
                                coloredButtonP = true
                                textField33.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField33.text!, color: "orange")
                            } else if(textField33.text!=="L"){
                                coloredButtonL = true
                                textField33.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField33.text!, color: "orange")
                            } else if(textField33.text!=="E"){
                                coloredButtonE = true
                                textField33.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField33.text!, color: "orange")
                            } else{
                                textField33.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField33.text!, color: "grey")
                            }
                        }
                        if(textField34.text!=="L"){
                            textField34.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField34.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField34.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField34.textColor = UIColor.white
                            if(textField34.text!=="A"){
                                coloredButtonA = true
                                textField34.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField34.text!, color: "orange")
                            } else if(textField34.text!=="P"){
                                coloredButtonP = true
                                textField34.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField34.text!, color: "orange")
                            } else if(textField34.text!=="P"){
                                coloredButtonP = true
                                textField34.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField34.text!, color: "orange")
                            } else if(textField34.text!=="E"){
                                coloredButtonE = true
                                textField34.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField34.text!, color: "orange")
                            } else{
                                textField34.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField34.text!, color: "grey")
                            }
                        }
                        if(textField35.text!=="E"){
                            textField35.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField35.textColor = UIColor.white
                            buttonE.backgroundColor = UIColor.blue
                            //buttonE.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField35.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField35.textColor = UIColor.white
                            if(textField35.text!=="A"){
                                coloredButtonA = true
                                textField35.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField35.text!, color: "orange")
                            } else if(textField35.text!=="P"){
                                coloredButtonP = true
                                textField35.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField35.text!, color: "orange")
                            } else if(textField35.text!=="P"){
                                coloredButtonP = true
                                textField35.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField35.text!, color: "orange")
                            } else if(textField35.text!=="L"){
                                coloredButtonL = true
                                textField35.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField35.text!, color: "orange")
                            } else{
                                textField35.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField35.text!, color: "grey")
                            }
                        }
                    } else if(randomWord=="EARLY"){
                        if(textField31.text!=="E"){
                            textField31.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField31.textColor = UIColor.white
                            buttonE.backgroundColor = UIColor.blue
                            //buttonE.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField31.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField31.textColor = UIColor.white
                            if(textField31.text!=="A"){
                                coloredButtonA = true
                                textField31.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField31.text!, color: "orange")
                            } else if(textField31.text!=="R"){
                                coloredButtonR = true
                                textField31.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField31.text!, color: "orange")
                            } else if(textField31.text!=="Y"){
                                coloredButtonY = true
                                textField31.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField31.text!, color: "orange")
                            } else if(textField31.text!=="L"){
                                coloredButtonL = true
                                textField31.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField31.text!, color: "orange")
                            } else{
                                textField31.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField31.text!, color: "grey")
                            }
                        }
                        if(textField32.text!=="A"){
                            textField32.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField32.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField32.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField32.textColor = UIColor.white
                            if(textField32.text!=="E"){
                                coloredButtonE = true
                                textField32.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField32.text!, color: "orange")
                            } else if(textField32.text!=="R"){
                                coloredButtonR = true
                                textField32.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField32.text!, color: "orange")
                            } else if(textField32.text!=="Y"){
                                coloredButtonY = true
                                textField32.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField32.text!, color: "orange")
                            } else if(textField32.text!=="L"){
                                coloredButtonL = true
                                textField32.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField32.text!, color: "orange")
                            } else{
                                textField32.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField32.text!, color: "grey")
                            }
                        }
                        if(textField33.text!=="R"){
                            textField33.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField33.textColor = UIColor.white
                            buttonR.backgroundColor = UIColor.blue
                            //buttonR.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField33.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField33.textColor = UIColor.white
                            if(textField33.text!=="E"){
                                coloredButtonE = true
                                textField33.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField33.text!, color: "orange")
                            } else if(textField33.text!=="A"){
                                coloredButtonA = true
                                textField33.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField33.text!, color: "orange")
                            } else if(textField33.text!=="Y"){
                                coloredButtonY = true
                                textField33.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField33.text!, color: "orange")
                            } else if(textField33.text!=="L"){
                                coloredButtonL = true
                                textField33.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField33.text!, color: "orange")
                            } else{
                                textField33.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField33.text!, color: "grey")
                            }
                        }
                        if(textField34.text!=="L"){
                            textField34.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField34.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField34.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField34.textColor = UIColor.white
                            if(textField34.text!=="E"){
                                coloredButtonE = true
                                textField34.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField34.text!, color: "orange")
                            } else if(textField34.text!=="A"){
                                coloredButtonA = true
                                textField34.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField34.text!, color: "orange")
                            } else if(textField34.text!=="Y"){
                                coloredButtonY = true
                                textField34.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField34.text!, color: "orange")
                            } else if(textField34.text!=="R"){
                                coloredButtonR = true
                                textField34.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField34.text!, color: "orange")
                            } else{
                                textField34.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField34.text!, color: "grey")
                            }
                        }
                        if(textField35.text!=="Y"){
                            textField35.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField35.textColor = UIColor.white
                            buttonY.backgroundColor = UIColor.blue
                            //buttonY.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField35.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField35.textColor = UIColor.white
                            if(textField35.text!=="E"){
                                coloredButtonE = true
                                textField35.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField35.text!, color: "orange")
                            } else if(textField35.text!=="A"){
                                coloredButtonA = true
                                textField35.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField35.text!, color: "orange")
                            } else if(textField35.text!=="L"){
                                coloredButtonL = true
                                textField35.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField35.text!, color: "orange")
                            } else if(textField35.text!=="R"){
                                coloredButtonR = true
                                textField35.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField35.text!, color: "orange")
                            } else{
                                textField35.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField35.text!, color: "grey")
                            }
                        }
                    } else if(randomWord=="HABIT"){
                        if(textField31.text!=="H"){
                            textField31.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField31.textColor = UIColor.white
                            buttonH.backgroundColor = UIColor.blue
                            //buttonH.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField31.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField31.textColor = UIColor.white
                            if(textField31.text!=="B"){
                                coloredButtonB = true
                                textField31.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField31.text!, color: "orange")
                            } else if(textField31.text!=="A"){
                                coloredButtonA = true
                                textField31.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField31.text!, color: "orange")
                            } else if(textField31.text!=="I"){
                                coloredButtonI = true
                                textField31.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField31.text!, color: "orange")
                            } else if(textField31.text!=="T"){
                                coloredButtonT = true
                                textField31.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField31.text!, color: "orange")
                            } else{
                                textField31.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField31.text!, color: "grey")
                            }
                        }
                        if(textField32.text!=="A"){
                            textField32.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField32.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField32.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField32.textColor = UIColor.white
                            if(textField32.text!=="B"){
                                coloredButtonB = true
                                textField32.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField32.text!, color: "orange")
                            } else if(textField32.text!=="H"){
                                coloredButtonH = true
                                textField32.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField32.text!, color: "orange")
                            } else if(textField32.text!=="I"){
                                coloredButtonI = true
                                textField32.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField32.text!, color: "orange")
                            } else if(textField32.text!=="T"){
                                coloredButtonT = true
                                textField32.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField32.text!, color: "orange")
                            } else{
                                textField32.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField32.text!, color: "grey")
                            }
                        }
                        if(textField33.text!=="B"){
                            textField33.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField33.textColor = UIColor.white
                            buttonB.backgroundColor = UIColor.blue
                            //buttonB.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField33.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField33.textColor = UIColor.white
                            if(textField33.text!=="A"){
                                coloredButtonA = true
                                textField33.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField33.text!, color: "orange")
                            } else if(textField33.text!=="H"){
                                coloredButtonH = true
                                textField33.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField33.text!, color: "orange")
                            } else if(textField33.text!=="I"){
                                coloredButtonI = true
                                textField33.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField33.text!, color: "orange")
                            } else if(textField33.text!=="T"){
                                coloredButtonT = true
                                textField33.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField33.text!, color: "orange")
                            } else{
                                textField33.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField33.text!, color: "grey")
                            }
                        }
                        if(textField34.text!=="I"){
                            textField34.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField34.textColor = UIColor.white
                            buttonI.backgroundColor = UIColor.blue
                            //buttonI.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField34.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField34.textColor = UIColor.white
                            if(textField34.text!=="A"){
                                coloredButtonA = true
                                textField34.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField34.text!, color: "orange")
                            } else if(textField34.text!=="H"){
                                coloredButtonH = true
                                textField34.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField34.text!, color: "orange")
                            } else if(textField34.text!=="B"){
                                coloredButtonB = true
                                textField34.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField34.text!, color: "orange")
                            } else if(textField34.text!=="T"){
                                coloredButtonT = true
                                textField34.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField34.text!, color: "orange")
                            } else{
                                textField34.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField34.text!, color: "grey")
                            }
                        }
                        if(textField35.text!=="T"){
                            textField35.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField35.textColor = UIColor.white
                            buttonT.backgroundColor = UIColor.blue
                            //buttonT.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField35.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField35.textColor = UIColor.white
                            if(textField35.text!=="A"){
                                coloredButtonA = true
                                textField35.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField35.text!, color: "orange")
                            } else if(textField35.text!=="H"){
                                coloredButtonH = true
                                textField35.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField35.text!, color: "orange")
                            } else if(textField35.text!=="B"){
                                coloredButtonB = true
                                textField35.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField35.text!, color: "orange")
                            } else if(textField35.text!=="I"){
                                coloredButtonI = true
                                textField35.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField35.text!, color: "orange")
                            } else{
                                textField35.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField35.text!, color: "grey")
                            }
                        }
                    } else {
                        if(textField31.text!=="L"){
                            textField31.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField31.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField31.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField31.textColor = UIColor.white
                            if(textField31.text!=="A"){
                                coloredButtonA = true
                                textField31.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField31.text!, color: "orange")
                            } else if(textField31.text!=="E"){
                                coloredButtonE = true
                                textField31.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField31.text!, color: "orange")
                            } else if(textField31.text!=="B"){
                                coloredButtonB = true
                                textField31.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField31.text!, color: "orange")
                            } else if(textField31.text!=="L"){
                                coloredButtonL = true
                                textField31.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField31.text!, color: "orange")
                            } else{
                                textField31.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField31.text!, color: "grey")
                            }
                        }
                        if(textField32.text!=="A"){
                            textField32.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField32.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField32.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField32.textColor = UIColor.white
                            if(textField32.text!=="L"){
                                coloredButtonL = true
                                textField32.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField32.text!, color: "orange")
                            } else if(textField32.text!=="E"){
                                coloredButtonE = true
                                textField32.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField32.text!, color: "orange")
                            } else if(textField32.text!=="B"){
                                coloredButtonB = true
                                textField32.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField32.text!, color: "orange")
                            } else if(textField32.text!=="L"){
                                coloredButtonL = true
                                textField32.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField32.text!, color: "orange")
                            } else{
                                textField32.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField32.text!, color: "grey")
                            }
                        }
                        if(textField33.text!=="B"){
                            textField33.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField33.textColor = UIColor.white
                            buttonB.backgroundColor = UIColor.blue
                            //buttonB.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField33.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField33.textColor = UIColor.white
                            if(textField33.text!=="L"){
                                coloredButtonL = true
                                textField33.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField33.text!, color: "orange")
                            } else if(textField33.text!=="E"){
                                coloredButtonE = true
                                textField33.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField33.text!, color: "orange")
                            } else if(textField33.text!=="A"){
                                coloredButtonA = true
                                textField33.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField33.text!, color: "orange")
                            } else if(textField33.text!=="L"){
                                coloredButtonL = true
                                textField33.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField33.text!, color: "orange")
                            } else{
                                textField33.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField33.text!, color: "grey")
                            }
                        }
                        if(textField34.text!=="E"){
                            textField34.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField34.textColor = UIColor.white
                            buttonE.backgroundColor = UIColor.blue
                            //buttonE.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField34.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField34.textColor = UIColor.white
                            if(textField34.text!=="L"){
                                coloredButtonL = true
                                textField34.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField34.text!, color: "orange")
                            } else if(textField34.text!=="B"){
                                coloredButtonB = true
                                textField34.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField34.text!, color: "orange")
                            } else if(textField34.text!=="A"){
                                coloredButtonA = true
                                textField34.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField34.text!, color: "orange")
                            } else if(textField34.text!=="L"){
                                coloredButtonL = true
                                textField34.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField34.text!, color: "orange")
                            } else{
                                textField34.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField34.text!, color: "grey")
                            }
                        }
                        if(textField35.text!=="L"){
                            textField35.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField35.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField35.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField35.textColor = UIColor.white
                            if(textField35.text!=="E"){
                                coloredButtonE = true
                                textField35.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField35.text!, color: "orange")
                            } else if(textField35.text!=="B"){
                                coloredButtonB = true
                                textField35.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField35.text!, color: "orange")
                            } else if(textField35.text!=="A"){
                                coloredButtonA = true
                                textField35.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField35.text!, color: "orange")
                            } else if(textField35.text!=="L"){
                                coloredButtonL = true
                                textField35.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField35.text!, color: "orange")
                            } else{
                                textField35.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField35.text!, color: "grey")
                            }
                        }
                    }
                    
                } else if(guessNumber==4){
                    if(randomWord=="DRINK"){
                        if(textField41.text!=="D"){
                            textField41.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField41.textColor = UIColor.white
                            buttonD.backgroundColor = UIColor.blue
                            //buttonD.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField41.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField41.textColor = UIColor.white
                            if(textField41.text!=="I"){
                                coloredButtonI = true
                                textField41.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField41.text!, color: "orange")
                            } else if(textField41.text!=="N"){
                                coloredButtonN = true
                                textField41.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField41.text!, color: "orange")
                            } else if(textField41.text!=="K"){
                                coloredButtonK = true
                                textField41.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField41.text!, color: "orange")
                            } else if(textField41.text!=="R"){
                                coloredButtonR = true
                                textField41.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField41.text!, color: "orange")
                            } else{
                                textField41.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField41.text!, color: "grey")
                            }
                        }
                        if(textField42.text!=="R"){
                            textField42.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField42.textColor = UIColor.white
                            buttonR.backgroundColor = UIColor.blue
                            //buttonR.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField42.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField42.textColor = UIColor.white
                            if(textField42.text!=="I"){
                                coloredButtonI = true
                                textField42.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField42.text!, color: "orange")
                            } else if(textField42.text!=="N"){
                                coloredButtonN = true
                                textField42.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField42.text!, color: "orange")
                            } else if(textField42.text!=="K"){
                                coloredButtonK = true
                                textField42.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField42.text!, color: "orange")
                            } else if(textField42.text!=="D"){
                                coloredButtonD = true
                                textField42.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField42.text!, color: "orange")
                            } else{
                                textField42.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField42.text!, color: "grey")
                            }
                        }
                        if(textField43.text!=="I"){
                            textField43.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField43.textColor = UIColor.white
                            buttonI.backgroundColor = UIColor.blue
                            //buttonI.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField43.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField43.textColor = UIColor.white
                            if(textField43.text!=="R"){
                                coloredButtonR = true
                                textField43.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField43.text!, color: "orange")
                            } else if(textField43.text!=="N"){
                                coloredButtonN = true
                                textField43.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField43.text!, color: "orange")
                            } else if(textField43.text!=="K"){
                                coloredButtonK = true
                                textField43.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField43.text!, color: "orange")
                            } else if(textField43.text!=="D"){
                                coloredButtonD = true
                                textField43.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField43.text!, color: "orange")
                            } else{
                                textField43.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField43.text!, color: "grey")
                            }
                        }
                        if(textField44.text!=="N"){
                            textField44.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField44.textColor = UIColor.white
                            buttonN.backgroundColor = UIColor.blue
                            //buttonN.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField44.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField44.textColor = UIColor.white
                            if(textField44.text!=="R"){
                                coloredButtonR = true
                                textField44.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField44.text!, color: "orange")
                            } else if(textField44.text!=="I"){
                                coloredButtonI = true
                                textField44.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField44.text!, color: "orange")
                            } else if(textField44.text!=="K"){
                                coloredButtonK = true
                                textField44.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField44.text!, color: "orange")
                            } else if(textField44.text!=="D"){
                                coloredButtonD = true
                                textField44.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField44.text!, color: "orange")
                            } else{
                                textField44.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField44.text!, color: "grey")
                            }
                        }
                        if(textField45.text!=="K"){
                            textField45.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField45.textColor = UIColor.white
                            buttonK.backgroundColor = UIColor.blue
                            //buttonK.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField45.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField45.textColor = UIColor.white
                            if(textField45.text!=="R"){
                                coloredButtonR = true
                                textField45.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField45.text!, color: "orange")
                            } else if(textField45.text!=="I"){
                                coloredButtonI = true
                                textField45.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField45.text!, color: "orange")
                            } else if(textField45.text!=="N"){
                                coloredButtonN = true
                                textField45.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField45.text!, color: "orange")
                            } else if(textField45.text!=="D"){
                                coloredButtonD = true
                                textField45.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField45.text!, color: "orange")
                            } else{
                                textField45.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField45.text!, color: "grey")
                            }
                        }
                    } else if(randomWord=="APPLE"){
                        if(textField41.text!=="A"){
                            textField41.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField41.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField41.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField41.textColor = UIColor.white
                            if(textField41.text!=="P"){
                                coloredButtonP = true
                                textField41.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField41.text!, color: "orange")
                            } else if(textField41.text!=="P"){
                                coloredButtonP = true
                                textField41.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField41.text!, color: "orange")
                            } else if(textField41.text!=="L"){
                                coloredButtonL = true
                                textField41.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField41.text!, color: "orange")
                            } else if(textField41.text!=="E"){
                                coloredButtonE = true
                                textField41.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField41.text!, color: "orange")
                            } else{
                                textField41.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField41.text!, color: "grey")
                            }
                        }
                        if(textField42.text!=="P"){
                            textField42.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField42.textColor = UIColor.white
                            buttonP.backgroundColor = UIColor.blue
                            //buttonP.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField42.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField42.textColor = UIColor.white
                            if(textField42.text!=="A"){
                                coloredButtonA = true
                                textField42.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField42.text!, color: "orange")
                            } else if(textField42.text!=="P"){
                                coloredButtonP = true
                                textField42.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField42.text!, color: "orange")
                            } else if(textField42.text!=="L"){
                                coloredButtonL = true
                                textField42.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField42.text!, color: "orange")
                            } else if(textField42.text!=="E"){
                                coloredButtonE = true
                                textField42.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField42.text!, color: "orange")
                            } else{
                                textField42.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField42.text!, color: "grey")
                            }
                        }
                        if(textField43.text!=="P"){
                            textField43.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField43.textColor = UIColor.white
                            buttonP.backgroundColor = UIColor.blue
                            //buttonP.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField43.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField43.textColor = UIColor.white
                            if(textField43.text!=="A"){
                                coloredButtonA = true
                                textField43.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField43.text!, color: "orange")
                            } else if(textField43.text!=="P"){
                                coloredButtonP = true
                                textField43.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField43.text!, color: "orange")
                            } else if(textField43.text!=="L"){
                                coloredButtonL = true
                                textField43.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField43.text!, color: "orange")
                            } else if(textField43.text!=="E"){
                                coloredButtonE = true
                                textField43.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField43.text!, color: "orange")
                            } else{
                                textField43.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField43.text!, color: "grey")
                            }
                        }
                        if(textField44.text!=="L"){
                            textField44.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField44.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField44.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField44.textColor = UIColor.white
                            if(textField44.text!=="A"){
                                coloredButtonA = true
                                textField44.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField44.text!, color: "orange")
                            } else if(textField44.text!=="P"){
                                coloredButtonP = true
                                textField44.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField44.text!, color: "orange")
                            } else if(textField44.text!=="P"){
                                coloredButtonP = true
                                textField44.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField44.text!, color: "orange")
                            } else if(textField44.text!=="E"){
                                coloredButtonE = true
                                textField44.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField44.text!, color: "orange")
                            } else{
                                textField44.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField44.text!, color: "grey")
                            }
                        }
                        if(textField45.text!=="E"){
                            textField45.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField45.textColor = UIColor.white
                            buttonE.backgroundColor = UIColor.blue
                            //buttonE.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField45.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField45.textColor = UIColor.white
                            if(textField45.text!=="A"){
                                coloredButtonA = true
                                textField45.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField45.text!, color: "orange")
                            } else if(textField45.text!=="P"){
                                coloredButtonP = true
                                textField45.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField45.text!, color: "orange")
                            } else if(textField45.text!=="P"){
                                coloredButtonP = true
                                textField45.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField45.text!, color: "orange")
                            } else if(textField45.text!=="L"){
                                coloredButtonL = true
                                textField45.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField45.text!, color: "orange")
                            } else{
                                textField45.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField45.text!, color: "grey")
                            }
                        }
                    } else if(randomWord=="EARLY"){
                        if(textField41.text!=="E"){
                            textField41.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField41.textColor = UIColor.white
                            buttonE.backgroundColor = UIColor.blue
                            //buttonE.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField41.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField41.textColor = UIColor.white
                            if(textField41.text!=="A"){
                                coloredButtonA = true
                                textField41.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField41.text!, color: "orange")
                            } else if(textField41.text!=="R"){
                                coloredButtonR = true
                                textField41.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField41.text!, color: "orange")
                            } else if(textField41.text!=="Y"){
                                coloredButtonY = true
                                textField41.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField41.text!, color: "orange")
                            } else if(textField41.text!=="L"){
                                coloredButtonL = true
                                textField41.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField41.text!, color: "orange")
                            } else{
                                textField41.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField41.text!, color: "grey")
                            }
                        }
                        if(textField42.text!=="A"){
                            textField42.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField42.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField42.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField42.textColor = UIColor.white
                            if(textField42.text!=="E"){
                                coloredButtonE = true
                                textField42.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField42.text!, color: "orange")
                            } else if(textField42.text!=="R"){
                                coloredButtonR = true
                                textField42.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField42.text!, color: "orange")
                            } else if(textField42.text!=="Y"){
                                coloredButtonY = true
                                textField42.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField42.text!, color: "orange")
                            } else if(textField42.text!=="L"){
                                coloredButtonL = true
                                textField42.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField42.text!, color: "orange")
                            } else{
                                textField42.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField42.text!, color: "grey")
                            }
                        }
                        if(textField43.text!=="R"){
                            textField43.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField43.textColor = UIColor.white
                            buttonR.backgroundColor = UIColor.blue
                            //buttonR.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField43.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField43.textColor = UIColor.white
                            if(textField43.text!=="E"){
                                coloredButtonE = true
                                textField43.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField43.text!, color: "orange")
                            } else if(textField43.text!=="A"){
                                coloredButtonA = true
                                textField43.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField43.text!, color: "orange")
                            } else if(textField43.text!=="Y"){
                                coloredButtonY = true
                                textField43.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField43.text!, color: "orange")
                            } else if(textField43.text!=="L"){
                                coloredButtonL = true
                                textField43.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField43.text!, color: "orange")
                            } else{
                                textField43.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField43.text!, color: "grey")
                            }
                        }
                        if(textField44.text!=="L"){
                            textField44.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField44.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField44.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField44.textColor = UIColor.white
                            if(textField44.text!=="E"){
                                coloredButtonE = true
                                textField44.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField44.text!, color: "orange")
                            } else if(textField44.text!=="A"){
                                coloredButtonA = true
                                textField44.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField44.text!, color: "orange")
                            } else if(textField44.text!=="Y"){
                                coloredButtonY = true
                                textField44.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField44.text!, color: "orange")
                            } else if(textField44.text!=="R"){
                                coloredButtonR = true
                                textField44.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField44.text!, color: "orange")
                            } else{
                                textField44.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField44.text!, color: "grey")
                            }
                        }
                        if(textField45.text!=="Y"){
                            textField45.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField45.textColor = UIColor.white
                            buttonY.backgroundColor = UIColor.blue
                            //buttonY.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField45.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField45.textColor = UIColor.white
                            if(textField45.text!=="E"){
                                coloredButtonE = true
                                textField45.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField45.text!, color: "orange")
                            } else if(textField45.text!=="A"){
                                coloredButtonA = true
                                textField45.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField45.text!, color: "orange")
                            } else if(textField45.text!=="L"){
                                coloredButtonL = true
                                textField45.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField45.text!, color: "orange")
                            } else if(textField45.text!=="R"){
                                coloredButtonR = true
                                textField45.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField45.text!, color: "orange")
                            } else{
                                textField45.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField45.text!, color: "grey")
                            }
                        }
                    } else if(randomWord=="HABIT"){
                        if(textField41.text!=="H"){
                            textField41.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField41.textColor = UIColor.white
                            buttonH.backgroundColor = UIColor.blue
                            //buttonH.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField41.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField41.textColor = UIColor.white
                            if(textField41.text!=="B"){
                                coloredButtonB = true
                                textField41.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField41.text!, color: "orange")
                            } else if(textField41.text!=="A"){
                                coloredButtonA = true
                                textField41.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField41.text!, color: "orange")
                            } else if(textField41.text!=="I"){
                                coloredButtonI = true
                                textField41.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField41.text!, color: "orange")
                            } else if(textField41.text!=="T"){
                                coloredButtonT = true
                                textField41.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField41.text!, color: "orange")
                            } else{
                                textField41.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField41.text!, color: "grey")
                            }
                        }
                        if(textField42.text!=="A"){
                            textField42.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField42.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField42.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField42.textColor = UIColor.white
                            if(textField42.text!=="B"){
                                coloredButtonB = true
                                textField42.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField42.text!, color: "orange")
                            } else if(textField42.text!=="H"){
                                coloredButtonH = true
                                textField42.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField42.text!, color: "orange")
                            } else if(textField42.text!=="I"){
                                coloredButtonI = true
                                textField42.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField42.text!, color: "orange")
                            } else if(textField42.text!=="T"){
                                coloredButtonT = true
                                textField42.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField42.text!, color: "orange")
                            } else{
                                textField42.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField42.text!, color: "grey")
                            }
                        }
                        if(textField43.text!=="B"){
                            textField43.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField43.textColor = UIColor.white
                            buttonB.backgroundColor = UIColor.blue
                            //buttonB.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField43.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField43.textColor = UIColor.white
                            if(textField43.text!=="A"){
                                coloredButtonA = true
                                textField43.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField43.text!, color: "orange")
                            } else if(textField43.text!=="H"){
                                coloredButtonH = true
                                textField43.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField43.text!, color: "orange")
                            } else if(textField43.text!=="I"){
                                coloredButtonI = true
                                textField43.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField43.text!, color: "orange")
                            } else if(textField43.text!=="T"){
                                coloredButtonT = true
                                textField43.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField43.text!, color: "orange")
                            } else{
                                textField43.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField43.text!, color: "grey")
                            }
                        }
                        if(textField44.text!=="I"){
                            textField44.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField44.textColor = UIColor.white
                            buttonI.backgroundColor = UIColor.blue
                            //buttonI.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField44.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField44.textColor = UIColor.white
                            if(textField44.text!=="A"){
                                coloredButtonA = true
                                textField44.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField44.text!, color: "orange")
                            } else if(textField44.text!=="H"){
                                coloredButtonH = true
                                textField44.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField44.text!, color: "orange")
                            } else if(textField44.text!=="B"){
                                coloredButtonB = true
                                textField44.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField44.text!, color: "orange")
                            } else if(textField44.text!=="T"){
                                coloredButtonT = true
                                textField44.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField44.text!, color: "orange")
                            } else{
                                textField44.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField44.text!, color: "grey")
                            }
                        }
                        if(textField45.text!=="T"){
                            textField45.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField45.textColor = UIColor.white
                            buttonT.backgroundColor = UIColor.blue
                            //buttonT.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField45.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField45.textColor = UIColor.white
                            if(textField45.text!=="A"){
                                coloredButtonA = true
                                textField45.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField45.text!, color: "orange")
                            } else if(textField45.text!=="H"){
                                coloredButtonH = true
                                textField45.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField45.text!, color: "orange")
                            } else if(textField45.text!=="B"){
                                coloredButtonB = true
                                textField45.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField45.text!, color: "orange")
                            } else if(textField45.text!=="I"){
                                coloredButtonI = true
                                textField45.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField45.text!, color: "orange")
                            } else{
                                textField45.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField45.text!, color: "grey")
                            }
                        }
                    } else {
                        if(textField41.text!=="L"){
                            textField41.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField41.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField41.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField41.textColor = UIColor.white
                            if(textField41.text!=="A"){
                                coloredButtonA = true
                                textField41.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField41.text!, color: "orange")
                            } else if(textField41.text!=="E"){
                                coloredButtonE = true
                                textField41.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField41.text!, color: "orange")
                            } else if(textField41.text!=="B"){
                                coloredButtonB = true
                                textField41.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField41.text!, color: "orange")
                            } else if(textField41.text!=="L"){
                                coloredButtonL = true
                                textField41.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField41.text!, color: "orange")
                            } else{
                                textField41.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField41.text!, color: "grey")
                            }
                        }
                        if(textField42.text!=="A"){
                            textField42.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField42.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField42.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField42.textColor = UIColor.white
                            if(textField42.text!=="L"){
                                coloredButtonL = true
                                textField42.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField42.text!, color: "orange")
                            } else if(textField42.text!=="E"){
                                coloredButtonE = true
                                textField42.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField42.text!, color: "orange")
                            } else if(textField42.text!=="B"){
                                coloredButtonB = true
                                textField42.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField42.text!, color: "orange")
                            } else if(textField42.text!=="L"){
                                coloredButtonL = true
                                textField42.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField42.text!, color: "orange")
                            } else{
                                textField42.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField42.text!, color: "grey")
                            }
                        }
                        if(textField43.text!=="B"){
                            textField43.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField43.textColor = UIColor.white
                            buttonB.backgroundColor = UIColor.blue
                            //buttonB.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField43.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField43.textColor = UIColor.white
                            if(textField43.text!=="L"){
                                coloredButtonL = true
                                textField43.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField43.text!, color: "orange")
                            } else if(textField43.text!=="E"){
                                coloredButtonE = true
                                textField43.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField43.text!, color: "orange")
                            } else if(textField43.text!=="A"){
                                coloredButtonA = true
                                textField43.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField43.text!, color: "orange")
                            } else if(textField43.text!=="L"){
                                coloredButtonL = true
                                textField43.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField43.text!, color: "orange")
                            } else{
                                textField43.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField43.text!, color: "grey")
                            }
                        }
                        if(textField44.text!=="E"){
                            textField44.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField44.textColor = UIColor.white
                            buttonE.backgroundColor = UIColor.blue
                            //buttonE.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField44.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField44.textColor = UIColor.white
                            if(textField44.text!=="L"){
                                coloredButtonL = true
                                textField44.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField44.text!, color: "orange")
                            } else if(textField44.text!=="B"){
                                coloredButtonB = true
                                textField44.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField44.text!, color: "orange")
                            } else if(textField44.text!=="A"){
                                coloredButtonA = true
                                textField44.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField44.text!, color: "orange")
                            } else if(textField44.text!=="L"){
                                coloredButtonL = true
                                textField44.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField44.text!, color: "orange")
                            } else{
                                textField44.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField44.text!, color: "grey")
                            }
                        }
                        if(textField45.text!=="L"){
                            textField45.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField45.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField45.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField45.textColor = UIColor.white
                            if(textField45.text!=="E"){
                                coloredButtonE = true
                                textField45.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField45.text!, color: "orange")
                            } else if(textField45.text!=="B"){
                                coloredButtonB = true
                                textField45.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField45.text!, color: "orange")
                            } else if(textField45.text!=="A"){
                                coloredButtonA = true
                                textField45.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField45.text!, color: "orange")
                            } else if(textField45.text!=="L"){
                                coloredButtonL = true
                                textField45.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField45.text!, color: "orange")
                            } else{
                                textField45.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField45.text!, color: "grey")
                            }
                        }
                    }
                    
                } else if(guessNumber==5){
                    if(randomWord=="DRINK"){
                        if(textField51.text!=="D"){
                            textField51.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField51.textColor = UIColor.white
                            buttonD.backgroundColor = UIColor.blue
                            //buttonD.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField51.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField51.textColor = UIColor.white
                            if(textField51.text!=="R"){
                                coloredButtonR = true
                                textField51.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField51.text!, color: "orange")
                            } else if(textField51.text!=="I"){
                                coloredButtonI = true
                                textField51.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField51.text!, color: "orange")
                            } else if(textField51.text!=="N"){
                                coloredButtonN = true
                                textField51.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField51.text!, color: "orange")
                            } else if(textField51.text!=="K"){
                                coloredButtonK = true
                                textField51.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField51.text!, color: "orange")
                            } else{
                                textField51.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField51.text!, color: "grey")
                            }
                        }
                        if(textField52.text!=="R"){
                            textField52.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField52.textColor = UIColor.white
                            buttonR.backgroundColor = UIColor.blue
                            //buttonR.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField52.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField52.textColor = UIColor.white
                            if(textField52.text!=="D"){
                                coloredButtonD = true
                                textField52.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField52.text!, color: "orange")
                            } else if(textField52.text!=="I"){
                                coloredButtonI = true
                                textField52.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField52.text!, color: "orange")
                            } else if(textField52.text!=="N"){
                                coloredButtonN = true
                                textField52.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField52.text!, color: "orange")
                            } else if(textField52.text!=="K"){
                                coloredButtonK = true
                                textField52.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField52.text!, color: "orange")
                            } else{
                                textField52.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField52.text!, color: "grey")
                            }
                        }
                        if(textField53.text!=="I"){
                            textField53.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField53.textColor = UIColor.white
                            buttonI.backgroundColor = UIColor.blue
                            //buttonI.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField53.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField53.textColor = UIColor.white
                            if(textField53.text!=="D"){
                                coloredButtonD = true
                                textField53.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField53.text!, color: "orange")
                            } else if(textField53.text!=="R"){
                                coloredButtonR = true
                                textField53.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField53.text!, color: "orange")
                            } else if(textField53.text!=="N"){
                                coloredButtonN = true
                                textField53.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField53.text!, color: "orange")
                            } else if(textField53.text!=="K"){
                                coloredButtonK = true
                                textField53.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField53.text!, color: "orange")
                            } else{
                                textField53.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField53.text!, color: "grey")
                            }
                        }
                        if(textField54.text!=="N"){
                            textField54.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField54.textColor = UIColor.white
                            buttonN.backgroundColor = UIColor.blue
                            //buttonN.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField54.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField54.textColor = UIColor.white
                            if(textField54.text!=="D"){
                                coloredButtonD = true
                                textField54.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField54.text!, color: "orange")
                            } else if(textField54.text!=="R"){
                                coloredButtonR = true
                                textField54.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField54.text!, color: "orange")
                            } else if(textField54.text!=="I"){
                                coloredButtonI = true
                                textField54.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField54.text!, color: "orange")
                            } else if(textField54.text!=="K"){
                                coloredButtonK = true
                                textField54.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField54.text!, color: "orange")
                            } else{
                                textField54.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField54.text!, color: "grey")
                            }
                        }
                        if(textField55.text!=="K"){
                            textField55.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField55.textColor = UIColor.white
                            buttonK.backgroundColor = UIColor.blue
                            //buttonK.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField55.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField55.textColor = UIColor.white
                            if(textField55.text!=="D"){
                                coloredButtonD = true
                                textField55.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField55.text!, color: "orange")
                            } else if(textField55.text!=="R"){
                                coloredButtonR = true
                                textField55.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField55.text!, color: "orange")
                            } else if(textField55.text!=="I"){
                                coloredButtonI = true
                                textField55.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField55.text!, color: "orange")
                            } else if(textField55.text!=="N"){
                                coloredButtonN = true
                                textField55.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField55.text!, color: "orange")
                            } else{
                                textField55.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField55.text!, color: "grey")
                            }
                        }
                    } else if(randomWord=="APPLE"){
                        if(textField51.text!=="A"){
                            textField51.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField51.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField51.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField51.textColor = UIColor.white
                            if(textField51.text!=="P"){
                                coloredButtonP = true
                                textField51.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField51.text!, color: "orange")
                            } else if(textField51.text!=="P"){
                                coloredButtonP = true
                                textField51.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField51.text!, color: "orange")
                            } else if(textField51.text!=="L"){
                                coloredButtonL = true
                                textField51.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField51.text!, color: "orange")
                            } else if(textField51.text!=="E"){
                                coloredButtonE = true
                                textField51.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField51.text!, color: "orange")
                            } else{
                                textField51.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField51.text!, color: "grey")
                            }
                        }
                        if(textField52.text!=="P"){
                            textField52.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField52.textColor = UIColor.white
                            buttonP.backgroundColor = UIColor.blue
                            //buttonP.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField52.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField52.textColor = UIColor.white
                            if(textField52.text!=="A"){
                                coloredButtonA = true
                                textField52.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField52.text!, color: "orange")
                            } else if(textField52.text!=="P"){
                                coloredButtonP = true
                                textField52.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField52.text!, color: "orange")
                            } else if(textField52.text!=="L"){
                                coloredButtonL = true
                                textField52.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField52.text!, color: "orange")
                            } else if(textField52.text!=="E"){
                                coloredButtonE = true
                                textField52.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField52.text!, color: "orange")
                            } else{
                                textField52.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField52.text!, color: "grey")
                            }
                        }
                        if(textField53.text!=="P"){
                            textField53.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField53.textColor = UIColor.white
                            buttonP.backgroundColor = UIColor.blue
                            //buttonP.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField53.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField53.textColor = UIColor.white
                            if(textField53.text!=="A"){
                                coloredButtonA = true
                                textField53.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField53.text!, color: "orange")
                            } else if(textField53.text!=="P"){
                                coloredButtonP = true
                                textField53.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField53.text!, color: "orange")
                            } else if(textField53.text!=="L"){
                                coloredButtonL = true
                                textField53.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField53.text!, color: "orange")
                            } else if(textField53.text!=="E"){
                                coloredButtonE = true
                                textField53.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField53.text!, color: "orange")
                            } else{
                                textField53.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField53.text!, color: "grey")
                            }
                        }
                        if(textField54.text!=="L"){
                            textField54.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField54.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField54.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField54.textColor = UIColor.white
                            if(textField54.text!=="A"){
                                coloredButtonA = true
                                textField54.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField54.text!, color: "orange")
                            } else if(textField54.text!=="P"){
                                coloredButtonP = true
                                textField54.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField54.text!, color: "orange")
                            } else if(textField54.text!=="P"){
                                coloredButtonP = true
                                textField54.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField54.text!, color: "orange")
                            } else if(textField54.text!=="E"){
                                coloredButtonE = true
                                textField54.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField54.text!, color: "orange")
                            } else{
                                textField54.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField54.text!, color: "grey")
                            }
                        }
                        if(textField55.text!=="E"){
                            textField55.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField55.textColor = UIColor.white
                            buttonE.backgroundColor = UIColor.blue
                            //buttonE.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField55.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField55.textColor = UIColor.white
                            if(textField55.text!=="A"){
                                coloredButtonA = true
                                textField55.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField55.text!, color: "orange")
                            } else if(textField55.text!=="P"){
                                coloredButtonP = true
                                textField55.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField55.text!, color: "orange")
                            } else if(textField55.text!=="P"){
                                coloredButtonP = true
                                textField55.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField55.text!, color: "orange")
                            } else if(textField55.text!=="L"){
                                coloredButtonL = true
                                textField55.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField55.text!, color: "orange")
                            } else{
                                textField55.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField55.text!, color: "grey")
                            }
                        }
                    } else if(randomWord=="EARLY"){
                        if(textField51.text!=="E"){
                            textField51.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField51.textColor = UIColor.white
                            buttonE.backgroundColor = UIColor.blue
                            //buttonE.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField51.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField51.textColor = UIColor.white
                            if(textField51.text!=="A"){
                                coloredButtonA = true
                                textField51.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField51.text!, color: "orange")
                            } else if(textField51.text!=="R"){
                                coloredButtonR = true
                                textField51.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField51.text!, color: "orange")
                            } else if(textField51.text!=="Y"){
                                coloredButtonY = true
                                textField51.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField51.text!, color: "orange")
                            } else if(textField51.text!=="L"){
                                coloredButtonL = true
                                textField51.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField51.text!, color: "orange")
                            } else{
                                textField51.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField51.text!, color: "grey")
                            }
                        }
                        if(textField52.text!=="A"){
                            textField52.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField52.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField52.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField52.textColor = UIColor.white
                            if(textField52.text!=="E"){
                                coloredButtonE = true
                                textField52.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField52.text!, color: "orange")
                            } else if(textField52.text!=="R"){
                                coloredButtonR = true
                                textField52.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField52.text!, color: "orange")
                            } else if(textField52.text!=="Y"){
                                coloredButtonY = true
                                textField52.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField52.text!, color: "orange")
                            } else if(textField52.text!=="L"){
                                coloredButtonL = true
                                textField52.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField52.text!, color: "orange")
                            } else{
                                textField52.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField52.text!, color: "grey")
                            }
                        }
                        if(textField53.text!=="R"){
                            textField53.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField53.textColor = UIColor.white
                            buttonR.backgroundColor = UIColor.blue
                            //buttonR.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField53.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField53.textColor = UIColor.white
                            if(textField53.text!=="E"){
                                coloredButtonE = true
                                textField53.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField53.text!, color: "orange")
                            } else if(textField53.text!=="A"){
                                coloredButtonA = true
                                textField53.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField53.text!, color: "orange")
                            } else if(textField53.text!=="Y"){
                                coloredButtonY = true
                                textField53.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField53.text!, color: "orange")
                            } else if(textField53.text!=="L"){
                                coloredButtonL = true
                                textField53.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField53.text!, color: "orange")
                            } else{
                                textField53.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField53.text!, color: "grey")
                            }
                        }
                        if(textField54.text!=="L"){
                            textField54.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField54.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField54.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField54.textColor = UIColor.white
                            if(textField54.text!=="E"){
                                coloredButtonE = true
                                textField54.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField54.text!, color: "orange")
                            } else if(textField54.text!=="A"){
                                coloredButtonA = true
                                textField54.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField54.text!, color: "orange")
                            } else if(textField54.text!=="Y"){
                                coloredButtonY = true
                                textField54.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField54.text!, color: "orange")
                            } else if(textField54.text!=="R"){
                                coloredButtonR = true
                                textField54.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField54.text!, color: "orange")
                            } else{
                                textField54.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField54.text!, color: "grey")
                            }
                        }
                        if(textField55.text!=="Y"){
                            textField55.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField55.textColor = UIColor.white
                            buttonY.backgroundColor = UIColor.blue
                            //buttonY.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField55.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField55.textColor = UIColor.white
                            if(textField55.text!=="E"){
                                coloredButtonE = true
                                textField55.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField55.text!, color: "orange")
                            } else if(textField55.text!=="A"){
                                coloredButtonA = true
                                textField55.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField55.text!, color: "orange")
                            } else if(textField55.text!=="L"){
                                coloredButtonL = true
                                textField55.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField55.text!, color: "orange")
                            } else if(textField55.text!=="R"){
                                coloredButtonR = true
                                textField55.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField55.text!, color: "orange")
                            } else{
                                textField55.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField55.text!, color: "grey")
                            }
                        }
                    } else if(randomWord=="HABIT"){
                        if(textField51.text!=="H"){
                            textField51.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField51.textColor = UIColor.white
                            buttonH.backgroundColor = UIColor.blue
                            //buttonH.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField51.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField51.textColor = UIColor.white
                            if(textField51.text!=="B"){
                                coloredButtonB = true
                                textField51.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField51.text!, color: "orange")
                            } else if(textField51.text!=="A"){
                                coloredButtonA = true
                                textField51.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField51.text!, color: "orange")
                            } else if(textField51.text!=="I"){
                                coloredButtonI = true
                                textField51.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField51.text!, color: "orange")
                            } else if(textField51.text!=="T"){
                                coloredButtonT = true
                                textField51.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField51.text!, color: "orange")
                            } else{
                                textField51.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField51.text!, color: "grey")
                            }
                        }
                        if(textField52.text!=="A"){
                            textField52.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField52.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField52.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField52.textColor = UIColor.white
                            if(textField52.text!=="B"){
                                coloredButtonB = true
                                textField52.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField52.text!, color: "orange")
                            } else if(textField52.text!=="H"){
                                coloredButtonH = true
                                textField52.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField52.text!, color: "orange")
                            } else if(textField52.text!=="I"){
                                coloredButtonI = true
                                textField52.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField52.text!, color: "orange")
                            } else if(textField52.text!=="T"){
                                coloredButtonT = true
                                textField52.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField52.text!, color: "orange")
                            } else{
                                textField52.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField52.text!, color: "grey")
                            }
                        }
                        if(textField53.text!=="B"){
                            textField53.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField53.textColor = UIColor.white
                            buttonB.backgroundColor = UIColor.blue
                            //buttonB.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField53.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField53.textColor = UIColor.white
                            if(textField53.text!=="A"){
                                coloredButtonA = true
                                textField53.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField53.text!, color: "orange")
                            } else if(textField53.text!=="H"){
                                coloredButtonH = true
                                textField53.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField53.text!, color: "orange")
                            } else if(textField53.text!=="I"){
                                coloredButtonI = true
                                textField53.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField53.text!, color: "orange")
                            } else if(textField53.text!=="T"){
                                coloredButtonT = true
                                textField53.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField53.text!, color: "orange")
                            } else{
                                textField53.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField53.text!, color: "grey")
                            }
                        }
                        if(textField54.text!=="I"){
                            textField54.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField54.textColor = UIColor.white
                            buttonI.backgroundColor = UIColor.blue
                            //buttonI.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField54.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField54.textColor = UIColor.white
                            if(textField54.text!=="A"){
                                coloredButtonA = true
                                textField54.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField54.text!, color: "orange")
                            } else if(textField54.text!=="H"){
                                coloredButtonH = true
                                textField54.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField54.text!, color: "orange")
                            } else if(textField54.text!=="B"){
                                coloredButtonB = true
                                textField54.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField54.text!, color: "orange")
                            } else if(textField54.text!=="T"){
                                coloredButtonT = true
                                textField54.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField54.text!, color: "orange")
                            } else{
                                textField54.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField54.text!, color: "grey")
                            }
                        }
                        if(textField55.text!=="T"){
                            textField55.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField55.textColor = UIColor.white
                            buttonT.backgroundColor = UIColor.blue
                            //buttonT.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField55.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField55.textColor = UIColor.white
                            if(textField55.text!=="A"){
                                coloredButtonA = true
                                textField55.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField55.text!, color: "orange")
                            } else if(textField55.text!=="H"){
                                coloredButtonH = true
                                textField55.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField55.text!, color: "orange")
                            } else if(textField55.text!=="B"){
                                coloredButtonB = true
                                textField55.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField55.text!, color: "orange")
                            } else if(textField55.text!=="I"){
                                coloredButtonI = true
                                textField55.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField55.text!, color: "orange")
                            } else{
                                textField55.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField55.text!, color: "grey")
                            }
                        }
                    } else {
                        if(textField51.text!=="L"){
                            textField51.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField51.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField51.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField51.textColor = UIColor.white
                            if(textField51.text!=="A"){
                                coloredButtonA = true
                                textField51.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField51.text!, color: "orange")
                            } else if(textField51.text!=="E"){
                                coloredButtonE = true
                                textField51.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField51.text!, color: "orange")
                            } else if(textField51.text!=="B"){
                                coloredButtonB = true
                                textField51.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField51.text!, color: "orange")
                            } else if(textField51.text!=="L"){
                                coloredButtonL = true
                                textField51.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField51.text!, color: "orange")
                            } else{
                                textField51.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField51.text!, color: "grey")
                            }
                        }
                        if(textField52.text!=="A"){
                            textField52.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField52.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField52.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField52.textColor = UIColor.white
                            if(textField52.text!=="L"){
                                coloredButtonL = true
                                textField52.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField52.text!, color: "orange")
                            } else if(textField52.text!=="E"){
                                coloredButtonE = true
                                textField52.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField52.text!, color: "orange")
                            } else if(textField52.text!=="B"){
                                coloredButtonB = true
                                textField52.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField52.text!, color: "orange")
                            } else if(textField52.text!=="L"){
                                coloredButtonL = true
                                textField52.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField52.text!, color: "orange")
                            } else{
                                textField52.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField52.text!, color: "grey")
                            }
                        }
                        if(textField53.text!=="B"){
                            textField53.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField53.textColor = UIColor.white
                            buttonB.backgroundColor = UIColor.blue
                            //buttonB.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField53.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField53.textColor = UIColor.white
                            if(textField53.text!=="L"){
                                coloredButtonL = true
                                textField53.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField53.text!, color: "orange")
                            } else if(textField53.text!=="E"){
                                coloredButtonE = true
                                textField53.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField53.text!, color: "orange")
                            } else if(textField53.text!=="A"){
                                coloredButtonA = true
                                textField53.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField53.text!, color: "orange")
                            } else if(textField53.text!=="L"){
                                coloredButtonL = true
                                textField53.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField53.text!, color: "orange")
                            } else{
                                textField53.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField53.text!, color: "grey")
                            }
                        }
                        if(textField54.text!=="E"){
                            textField54.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField54.textColor = UIColor.white
                            buttonE.backgroundColor = UIColor.blue
                            //buttonE.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField54.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField54.textColor = UIColor.white
                            if(textField54.text!=="L"){
                                coloredButtonL = true
                                textField54.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField54.text!, color: "orange")
                            } else if(textField54.text!=="B"){
                                coloredButtonB = true
                                textField54.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField54.text!, color: "orange")
                            } else if(textField54.text!=="A"){
                                coloredButtonA = true
                                textField54.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField54.text!, color: "orange")
                            } else if(textField54.text!=="L"){
                                coloredButtonL = true
                                textField54.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField54.text!, color: "orange")
                            } else{
                                textField54.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField54.text!, color: "grey")
                            }
                        }
                        if(textField55.text!=="L"){
                            textField55.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField55.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField55.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField55.textColor = UIColor.white
                            if(textField55.text!=="E"){
                                coloredButtonE = true
                                textField55.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField55.text!, color: "orange")
                            } else if(textField55.text!=="B"){
                                coloredButtonB = true
                                textField55.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField55.text!, color: "orange")
                            } else if(textField55.text!=="A"){
                                coloredButtonA = true
                                textField55.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField55.text!, color: "orange")
                            } else if(textField55.text!=="L"){
                                coloredButtonL = true
                                textField55.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField55.text!, color: "orange")
                            } else{
                                textField55.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField55.text!, color: "grey")
                            }
                        }
                    }
                    
                } else if(guessNumber==6){
                    if(randomWord=="DRINK"){
                        if(textField61.text!=="D"){
                            textField61.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField61.textColor = UIColor.white
                            buttonD.backgroundColor = UIColor.blue
                            //buttonD.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField61.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField61.textColor = UIColor.white
                            if(textField61.text!=="R"){
                                coloredButtonR = true
                                textField61.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField61.text!, color: "orange")
                            } else if(textField61.text!=="I"){
                                coloredButtonI = true
                                textField61.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField61.text!, color: "orange")
                            } else if(textField61.text!=="N"){
                                coloredButtonN = true
                                textField61.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField61.text!, color: "orange")
                            } else if(textField61.text!=="K"){
                                coloredButtonK = true
                                textField61.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField61.text!, color: "orange")
                            } else{
                                textField61.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField61.text!, color: "grey")
                            }
                        }
                        if(textField62.text!=="R"){
                            textField62.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField62.textColor = UIColor.white
                            buttonR.backgroundColor = UIColor.blue
                            //buttonR.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField62.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField62.textColor = UIColor.white
                            if(textField62.text!=="D"){
                                coloredButtonD = true
                                textField62.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField62.text!, color: "orange")
                            } else if(textField62.text!=="I"){
                                coloredButtonI = true
                                textField62.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField62.text!, color: "orange")
                            } else if(textField62.text!=="N"){
                                coloredButtonN = true
                                textField62.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField62.text!, color: "orange")
                            } else if(textField62.text!=="K"){
                                coloredButtonK = true
                                textField62.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField62.text!, color: "orange")
                            } else{
                                textField62.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField62.text!, color: "grey")
                            }
                        }
                        if(textField63.text!=="I"){
                            textField63.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField63.textColor = UIColor.white
                            buttonI.backgroundColor = UIColor.blue
                            //buttonI.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField63.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField63.textColor = UIColor.white
                            if(textField63.text!=="D"){
                                coloredButtonD = true
                                textField63.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField63.text!, color: "orange")
                            } else if(textField63.text!=="R"){
                                coloredButtonR = true
                                textField63.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField63.text!, color: "orange")
                            } else if(textField63.text!=="N"){
                                coloredButtonN = true
                                textField63.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField63.text!, color: "orange")
                            } else if(textField63.text!=="K"){
                                coloredButtonK = true
                                textField63.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField63.text!, color: "orange")
                            } else{
                                textField63.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField63.text!, color: "grey")
                            }
                        }
                        if(textField64.text!=="N"){
                            textField64.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField64.textColor = UIColor.white
                            buttonN.backgroundColor = UIColor.blue
                            //buttonN.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField64.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField64.textColor = UIColor.white
                            if(textField64.text!=="D"){
                                coloredButtonD = true
                                textField64.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField64.text!, color: "orange")
                            } else if(textField64.text!=="R"){
                                coloredButtonR = true
                                textField64.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField64.text!, color: "orange")
                            } else if(textField64.text!=="I"){
                                coloredButtonI = true
                                textField64.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField64.text!, color: "orange")
                            } else if(textField64.text!=="K"){
                                coloredButtonK = true
                                textField64.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField64.text!, color: "orange")
                            } else{
                                textField64.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField64.text!, color: "grey")
                            }
                        }
                        if(textField65.text!=="K"){
                            textField65.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField65.textColor = UIColor.white
                            buttonK.backgroundColor = UIColor.blue
                            //buttonK.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField65.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField65.textColor = UIColor.white
                            if(textField65.text!=="D"){
                                coloredButtonD = true
                                textField65.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField65.text!, color: "orange")
                            } else if(textField65.text!=="R"){
                                coloredButtonR = true
                                textField65.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField65.text!, color: "orange")
                            } else if(textField65.text!=="I"){
                                coloredButtonI = true
                                textField65.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField65.text!, color: "orange")
                            } else if(textField65.text!=="N"){
                                coloredButtonN = true
                                textField65.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField65.text!, color: "orange")
                            } else{
                                textField65.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField65.text!, color: "grey")
                            }
                        }
                    } else if(randomWord=="APPLE"){
                        if(textField61.text!=="A"){
                            textField61.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField61.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField61.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField61.textColor = UIColor.white
                            if(textField61.text!=="P"){
                                coloredButtonP = true
                                textField61.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField61.text!, color: "orange")
                            } else if(textField61.text!=="P"){
                                coloredButtonP = true
                                textField61.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField61.text!, color: "orange")
                            } else if(textField61.text!=="L"){
                                coloredButtonL = true
                                textField61.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField61.text!, color: "orange")
                            } else if(textField61.text!=="E"){
                                coloredButtonE = true
                                textField61.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField61.text!, color: "orange")
                            } else{
                                textField61.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField61.text!, color: "grey")
                            }
                        }
                        if(textField62.text!=="P"){
                            textField62.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField62.textColor = UIColor.white
                            buttonP.backgroundColor = UIColor.blue
                            //buttonP.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField62.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField62.textColor = UIColor.white
                            if(textField62.text!=="A"){
                                coloredButtonA = true
                                textField62.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField62.text!, color: "orange")
                            } else if(textField62.text!=="P"){
                                coloredButtonP = true
                                textField62.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField62.text!, color: "orange")
                            } else if(textField62.text!=="L"){
                                coloredButtonL = true
                                textField62.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField62.text!, color: "orange")
                            } else if(textField62.text!=="E"){
                                coloredButtonE = true
                                textField62.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField62.text!, color: "orange")
                            } else{
                                textField62.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField62.text!, color: "grey")
                            }
                        }
                        if(textField63.text!=="P"){
                            textField63.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField63.textColor = UIColor.white
                            buttonP.backgroundColor = UIColor.blue
                            //buttonP.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField63.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField63.textColor = UIColor.white
                            if(textField63.text!=="A"){
                                coloredButtonA = true
                                textField63.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField63.text!, color: "orange")
                            } else if(textField63.text!=="P"){
                                coloredButtonP = true
                                textField63.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField63.text!, color: "orange")
                            } else if(textField63.text!=="L"){
                                coloredButtonL = true
                                textField63.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField63.text!, color: "orange")
                            } else if(textField63.text!=="E"){
                                coloredButtonE = true
                                textField63.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField63.text!, color: "orange")
                            } else{
                                textField63.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField63.text!, color: "grey")
                            }
                        }
                        if(textField64.text!=="L"){
                            textField64.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField64.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField64.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField64.textColor = UIColor.white
                            if(textField64.text!=="A"){
                                coloredButtonA = true
                                textField64.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField64.text!, color: "orange")
                            } else if(textField64.text!=="P"){
                                coloredButtonP = true
                                textField64.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField64.text!, color: "orange")
                            } else if(textField64.text!=="P"){
                                coloredButtonP = true
                                textField64.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField64.text!, color: "orange")
                            } else if(textField64.text!=="E"){
                                coloredButtonE = true
                                textField64.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField64.text!, color: "orange")
                            } else{
                                textField64.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField64.text!, color: "grey")
                            }
                        }
                        if(textField65.text!=="E"){
                            textField65.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField65.textColor = UIColor.white
                            buttonE.backgroundColor = UIColor.blue
                            //buttonE.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField65.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField65.textColor = UIColor.white
                            if(textField65.text!=="A"){
                                coloredButtonA = true
                                textField65.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField65.text!, color: "orange")
                            } else if(textField65.text!=="P"){
                                coloredButtonP = true
                                textField65.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField65.text!, color: "orange")
                            } else if(textField65.text!=="P"){
                                coloredButtonP = true
                                textField65.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField65.text!, color: "orange")
                            } else if(textField65.text!=="L"){
                                coloredButtonL = true
                                textField65.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField65.text!, color: "orange")
                            } else{
                                textField65.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField65.text!, color: "grey")
                            }
                        }
                    } else if(randomWord=="EARLY"){
                        if(textField61.text!=="E"){
                            textField61.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField61.textColor = UIColor.white
                            buttonE.backgroundColor = UIColor.blue
                            //buttonE.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField61.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField61.textColor = UIColor.white
                            if(textField61.text!=="A"){
                                coloredButtonA = true
                                textField61.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField61.text!, color: "orange")
                            } else if(textField61.text!=="R"){
                                coloredButtonR = true
                                textField61.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField61.text!, color: "orange")
                            } else if(textField61.text!=="Y"){
                                coloredButtonY = true
                                textField61.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField61.text!, color: "orange")
                            } else if(textField61.text!=="L"){
                                coloredButtonL = true
                                textField61.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField61.text!, color: "orange")
                            } else{
                                textField61.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField61.text!, color: "grey")
                            }
                        }
                        if(textField62.text!=="A"){
                            textField62.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField62.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField62.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField62.textColor = UIColor.white
                            if(textField62.text!=="E"){
                                coloredButtonE = true
                                textField62.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField62.text!, color: "orange")
                            } else if(textField62.text!=="R"){
                                coloredButtonR = true
                                textField62.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField62.text!, color: "orange")
                            } else if(textField62.text!=="Y"){
                                coloredButtonY = true
                                textField62.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField62.text!, color: "orange")
                            } else if(textField62.text!=="L"){
                                coloredButtonL = true
                                textField62.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField62.text!, color: "orange")
                            } else{
                                textField62.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField62.text!, color: "grey")
                            }
                        }
                        if(textField63.text!=="R"){
                            textField63.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField63.textColor = UIColor.white
                            buttonR.backgroundColor = UIColor.blue
                            //buttonR.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField63.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField63.textColor = UIColor.white
                            if(textField63.text!=="E"){
                                coloredButtonE = true
                                textField63.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField63.text!, color: "orange")
                            } else if(textField63.text!=="A"){
                                coloredButtonA = true
                                textField63.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField63.text!, color: "orange")
                            } else if(textField63.text!=="Y"){
                                coloredButtonY = true
                                textField63.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField63.text!, color: "orange")
                            } else if(textField63.text!=="L"){
                                coloredButtonL = true
                                textField63.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField63.text!, color: "orange")
                            } else{
                                textField63.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField63.text!, color: "grey")
                            }
                        }
                        if(textField64.text!=="L"){
                            textField64.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField64.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField64.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField64.textColor = UIColor.white
                            if(textField64.text!=="E"){
                                coloredButtonE = true
                                textField64.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField64.text!, color: "orange")
                            } else if(textField64.text!=="A"){
                                coloredButtonA = true
                                textField64.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField64.text!, color: "orange")
                            } else if(textField64.text!=="Y"){
                                coloredButtonY = true
                                textField64.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField64.text!, color: "orange")
                            } else if(textField64.text!=="R"){
                                coloredButtonR = true
                                textField64.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField64.text!, color: "orange")
                            } else{
                                textField64.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField64.text!, color: "grey")
                            }
                        }
                        if(textField65.text!=="Y"){
                            textField65.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField65.textColor = UIColor.white
                            buttonY.backgroundColor = UIColor.blue
                            //buttonY.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField65.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField65.textColor = UIColor.white
                            if(textField65.text!=="E"){
                                coloredButtonE = true
                                textField65.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField65.text!, color: "orange")
                            } else if(textField65.text!=="A"){
                                coloredButtonA = true
                                textField65.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField65.text!, color: "orange")
                            } else if(textField65.text!=="L"){
                                coloredButtonL = true
                                textField65.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField65.text!, color: "orange")
                            } else if(textField65.text!=="R"){
                                coloredButtonR = true
                                textField65.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField65.text!, color: "orange")
                            } else{
                                textField65.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField65.text!, color: "grey")
                            }
                        }
                    } else if(randomWord=="HABIT"){
                        if(textField61.text!=="H"){
                            textField61.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField61.textColor = UIColor.white
                            buttonH.backgroundColor = UIColor.blue
                            //buttonH.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField61.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField61.textColor = UIColor.white
                            if(textField61.text!=="B"){
                                coloredButtonB = true
                                textField61.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField61.text!, color: "orange")
                            } else if(textField61.text!=="A"){
                                coloredButtonA = true
                                textField61.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField61.text!, color: "orange")
                            } else if(textField61.text!=="I"){
                                coloredButtonI = true
                                textField61.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField61.text!, color: "orange")
                            } else if(textField61.text!=="T"){
                                coloredButtonT = true
                                textField61.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField61.text!, color: "orange")
                            } else{
                                textField61.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField61.text!, color: "grey")
                            }
                        }
                        if(textField62.text!=="A"){
                            textField62.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField62.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField62.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField62.textColor = UIColor.white
                            if(textField62.text!=="B"){
                                coloredButtonB = true
                                textField62.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField62.text!, color: "orange")
                            } else if(textField62.text!=="H"){
                                coloredButtonH = true
                                textField62.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField62.text!, color: "orange")
                            } else if(textField62.text!=="I"){
                                coloredButtonI = true
                                textField62.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField62.text!, color: "orange")
                            } else if(textField62.text!=="T"){
                                coloredButtonT = true
                                textField62.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField62.text!, color: "orange")
                            } else{
                                textField62.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField62.text!, color: "grey")
                            }
                        }
                        if(textField63.text!=="B"){
                            textField63.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField63.textColor = UIColor.white
                            buttonB.backgroundColor = UIColor.blue
                            //buttonB.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField63.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField63.textColor = UIColor.white
                            if(textField63.text!=="A"){
                                coloredButtonA = true
                                textField63.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField63.text!, color: "orange")
                            } else if(textField63.text!=="H"){
                                coloredButtonH = true
                                textField63.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField63.text!, color: "orange")
                            } else if(textField63.text!=="I"){
                                coloredButtonI = true
                                textField63.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField63.text!, color: "orange")
                            } else if(textField63.text!=="T"){
                                coloredButtonT = true
                                textField63.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField63.text!, color: "orange")
                            } else{
                                textField63.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField63.text!, color: "grey")
                            }
                        }
                        if(textField64.text!=="I"){
                            textField64.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField64.textColor = UIColor.white
                            buttonI.backgroundColor = UIColor.blue
                            //buttonI.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField64.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField64.textColor = UIColor.white
                            if(textField64.text!=="A"){
                                coloredButtonA = true
                                textField64.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField64.text!, color: "orange")
                            } else if(textField64.text!=="H"){
                                coloredButtonH = true
                                textField64.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField64.text!, color: "orange")
                            } else if(textField64.text!=="B"){
                                coloredButtonB = true
                                textField64.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField64.text!, color: "orange")
                            } else if(textField64.text!=="T"){
                                coloredButtonT = true
                                textField64.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField64.text!, color: "orange")
                            } else{
                                textField64.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField64.text!, color: "grey")
                            }
                        }
                        if(textField65.text!=="T"){
                            textField65.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField65.textColor = UIColor.white
                            buttonT.backgroundColor = UIColor.blue
                            //buttonT.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField65.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField65.textColor = UIColor.white
                            if(textField65.text!=="A"){
                                coloredButtonA = true
                                textField65.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField65.text!, color: "orange")
                            } else if(textField65.text!=="H"){
                                coloredButtonH = true
                                textField65.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField65.text!, color: "orange")
                            } else if(textField65.text!=="B"){
                                coloredButtonB = true
                                textField65.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField65.text!, color: "orange")
                            } else if(textField65.text!=="I"){
                                coloredButtonI = true
                                textField65.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField65.text!, color: "orange")
                            } else{
                                textField65.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField65.text!, color: "grey")
                            }
                        }
                    } else {
                        if(textField61.text!=="L"){
                            textField61.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField61.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField61.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField61.textColor = UIColor.white
                            if(textField61.text!=="A"){
                                coloredButtonA = true
                                textField61.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField61.text!, color: "orange")
                            } else if(textField61.text!=="L"){
                                coloredButtonL = true
                                textField61.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField61.text!, color: "orange")
                            } else if(textField61.text!=="B"){
                                coloredButtonB = true
                                textField61.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField61.text!, color: "orange")
                            } else if(textField61.text!=="E"){
                                coloredButtonE = true
                                textField61.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField61.text!, color: "orange")
                            } else{
                                textField61.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField61.text!, color: "grey")
                            }
                        }
                        if(textField62.text!=="A"){
                            textField62.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField62.textColor = UIColor.white
                            buttonA.backgroundColor = UIColor.blue
                            //buttonA.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField62.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField62.textColor = UIColor.white
                            if(textField62.text!=="L"){
                                coloredButtonL = true
                                textField62.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField62.text!, color: "orange")
                            } else if(textField62.text!=="L"){
                                coloredButtonL = true
                                textField62.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField62.text!, color: "orange")
                            } else if(textField62.text!=="B"){
                                coloredButtonB = true
                                textField62.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField62.text!, color: "orange")
                            } else if(textField62.text!=="E"){
                                coloredButtonE = true
                                textField62.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField62.text!, color: "orange")
                            } else{
                                textField62.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField62.text!, color: "grey")
                            }
                        }
                        if(textField63.text!=="B"){
                            textField63.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField63.textColor = UIColor.white
                            buttonB.backgroundColor = UIColor.blue
                            //buttonB.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField63.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField63.textColor = UIColor.white
                            if(textField63.text!=="A"){
                                coloredButtonA = true
                                textField63.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField63.text!, color: "orange")
                            } else if(textField63.text!=="L"){
                                coloredButtonL = true
                                textField63.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField63.text!, color: "orange")
                            } else if(textField63.text!=="B"){
                                coloredButtonB = true
                                textField63.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField63.text!, color: "orange")
                            } else if(textField63.text!=="E"){
                                coloredButtonE = true
                                textField63.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField63.text!, color: "orange")
                            } else{
                                textField63.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField63.text!, color: "grey")
                            }
                        }
                        if(textField64.text!=="E"){
                            textField64.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField64.textColor = UIColor.white
                            buttonE.backgroundColor = UIColor.blue
                            //buttonE.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField64.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField64.textColor = UIColor.white
                            if(textField64.text!=="A"){
                                coloredButtonA = true
                                textField64.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField64.text!, color: "orange")
                            } else if(textField64.text!=="L"){
                                coloredButtonL = true
                                textField64.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField64.text!, color: "orange")
                            } else if(textField64.text!=="B"){
                                coloredButtonB = true
                                textField64.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField64.text!, color: "orange")
                            } else if(textField64.text!=="L"){
                                coloredButtonL = true
                                textField64.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField64.text!, color: "orange")
                            } else{
                                textField64.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField64.text!, color: "grey")
                            }
                        }
                        if(textField65.text!=="L"){
                            textField65.layer.backgroundColor = UIColor.systemBlue.cgColor
                            textField65.textColor = UIColor.white
                            buttonL.backgroundColor = UIColor.blue
                            //buttonL.titleLabel?.textColor = UIColor.blue
                        } else{
                            //textField65.layer.backgroundColor = UIColor.darkGray.cgColor
                            textField65.textColor = UIColor.white
                            if(textField65.text!=="A"){
                                coloredButtonA = true
                                textField65.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField65.text!, color: "orange")
                            } else if(textField65.text!=="E"){
                                coloredButtonE = true
                                textField65.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField65.text!, color: "orange")
                            } else if(textField65.text!=="B"){
                                coloredButtonB = true
                                textField65.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField65.text!, color: "orange")
                            } else if(textField65.text!=="L"){
                                coloredButtonL = true
                                textField65.layer.backgroundColor = UIColor.systemOrange.cgColor
                                turnButtonColor(letter: textField65.text!, color: "orange")
                            } else{
                                textField65.layer.backgroundColor = UIColor.darkGray.cgColor
                                turnButtonColor(letter: textField65.text!, color: "grey")
                            }
                        }
                    }
                    
                }
            }
        }else{
            
            //print("Unknown Word!")
            
            // Alert unknown word
            let alert = UIAlertController(title: "Unknown Word!", message: "Please correct the word.", preferredStyle: .alert)
                
                let okButton = UIAlertAction(title: "OK", style: .default) { _ in
                                }
                alert.addAction(okButton)
            self.show(alert, sender: nil)
            
            guessNumber = guessNumber - 1
            numberToFocus = numberFocused
    
        }
        
    
        // correct place = systemBlue, correct letter = systemOrange, wrong letter = darkGray, text color = white
        
        //if true set this true
        //correctGuess = true
        //textField11.layer.backgroundColor = UIColor.darkGray.cgColor
        //textField11.textColor = UIColor.white
    }
    
    
    func isCorrectWord(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    // Turn the button color when not matched
    func turnButtonColor(letter: String, color: String){
        //print(letter)
        
        switch letter {
        case "Q":
            if(color=="orange" && !coloredButtonQ2){
                buttonQ.backgroundColor = UIColor.orange
                coloredButtonQ2 = true
            } else {
                buttonQ.backgroundColor = UIColor.black
                //buttonQ.titleLabel?.textColor = UIColor.black
            }
        case "W":
            if(color=="orange" && !coloredButtonW2){
                buttonW.backgroundColor = UIColor.orange
                coloredButtonW2 = true
            } else {
                buttonW.backgroundColor = UIColor.black
                //buttonW.titleLabel?.textColor = UIColor.black
            }
        case "E":
            if(color=="orange" && !coloredButtonE2){
                buttonE.backgroundColor = UIColor.orange
                coloredButtonE2 = true
            } else {
                buttonE.backgroundColor = UIColor.black
                //buttonE.titleLabel?.textColor = UIColor.black
            }
        case "R":
            if(color=="orange" && !coloredButtonR2){
                buttonR.backgroundColor = UIColor.orange
                coloredButtonR2 = true
            } else {
                buttonR.backgroundColor = UIColor.black
                //buttonR.titleLabel?.textColor = UIColor.black
            }
        case "T":
            if(color=="orange" && !coloredButtonT2){
                buttonT.backgroundColor = UIColor.orange
                coloredButtonT2 = true
            } else {
                buttonT.backgroundColor = UIColor.black
                //buttonT.titleLabel?.textColor = UIColor.black
            }
        case "Y":
            if(color=="orange" && !coloredButtonY2){
                buttonY.backgroundColor = UIColor.orange
                coloredButtonY2 = true
            } else {
                buttonY.backgroundColor = UIColor.black
                //buttonY.titleLabel?.textColor = UIColor.black
            }
        case "U":
            if(color=="orange" && !coloredButtonU2){
                buttonU.backgroundColor = UIColor.orange
                coloredButtonU2 = true
            } else {
                buttonU.backgroundColor = UIColor.black
            //buttonU.titleLabel?.textColor = UIColor.black
            }
        case "I":
            if(color=="orange" && !coloredButtonI2){
                buttonI.backgroundColor = UIColor.orange
                coloredButtonI2 = true
            } else {
                buttonI.backgroundColor = UIColor.black
                //buttonI.titleLabel?.textColor = UIColor.black
            }
        case "O":
            if(color=="orange" && !coloredButtonO2){
                buttonO.backgroundColor = UIColor.orange
                coloredButtonO2 = true
            } else {
                buttonO.backgroundColor = UIColor.black
                //buttonO.titleLabel?.textColor = UIColor.black
            }
        case "P":
            if(color=="orange" && !coloredButtonP2){
                buttonP.backgroundColor = UIColor.orange
                coloredButtonP2 = true
            } else {
                buttonP.backgroundColor = UIColor.black
                //buttonP.titleLabel?.textColor = UIColor.black
            }
        case "A":
            if(color=="orange" && !coloredButtonA2){
                buttonA.backgroundColor = UIColor.orange
                coloredButtonA2 = true
            } else {
                buttonA.backgroundColor = UIColor.black
                //buttonA.titleLabel?.textColor = UIColor.black
            }
        case "S":
            if(color=="orange" && !coloredButtonS2){
                buttonS.backgroundColor = UIColor.orange
                coloredButtonS2 = true
            } else {
                buttonS.backgroundColor = UIColor.black
                //buttonS.titleLabel?.textColor = UIColor.black
            }
        case "D":
            if(color=="orange" && !coloredButtonD2){
                buttonD.backgroundColor = UIColor.orange
                coloredButtonD2 = true
            } else {
                buttonD.backgroundColor = UIColor.black
                //buttonD.titleLabel?.textColor = UIColor.black
            }
        case "F":
            if(color=="orange" && !coloredButtonF2){
                buttonF.backgroundColor = UIColor.orange
                coloredButtonF2 = true
            } else {
                buttonF.backgroundColor = UIColor.black
                //buttonF.titleLabel?.textColor = UIColor.black
            }
        case "G":
            if(color=="orange" && !coloredButtonG2){
                buttonG.backgroundColor = UIColor.orange
                coloredButtonG2 = true
            } else {
                buttonG.backgroundColor = UIColor.black
                //buttonG.titleLabel?.textColor = UIColor.black
            }
        case "H":
            if(color=="orange" && !coloredButtonH2){
                buttonH.backgroundColor = UIColor.orange
                coloredButtonH2 = true
            } else {
                buttonH.backgroundColor = UIColor.black
                //buttonH.titleLabel?.textColor = UIColor.black
            }
        case "J":
            if(color=="orange" && !coloredButtonJ2){
                buttonJ.backgroundColor = UIColor.orange
                coloredButtonJ2 = true
            } else {
                buttonJ.backgroundColor = UIColor.black
                //buttonJ.titleLabel?.textColor = UIColor.black
            }
        case "K":
            if(color=="orange" && !coloredButtonK2){
                buttonK.backgroundColor = UIColor.orange
                coloredButtonK2 = true
            } else {
                buttonK.backgroundColor = UIColor.black
                //buttonK.titleLabel?.textColor = UIColor.black
            }
        case "L":
            if(color=="orange" && !coloredButtonL2){
                buttonL.backgroundColor = UIColor.orange
                coloredButtonL2 = true
            } else {
                buttonL.backgroundColor = UIColor.black
                //buttonL.titleLabel?.textColor = UIColor.black
            }
        case "Z":
            if(color=="orange" && !coloredButtonZ2){
                buttonZ.backgroundColor = UIColor.orange
                coloredButtonZ2 = true
            } else {
                buttonZ.backgroundColor = UIColor.black
                //buttonZ.titleLabel?.textColor = UIColor.black
            }
        case "X":
            if(color=="orange" && !coloredButtonX2){
                buttonX.backgroundColor = UIColor.orange
                coloredButtonX2 = true
            } else {
                buttonX.backgroundColor = UIColor.black
                //buttonX.titleLabel?.textColor = UIColor.black
            }
        case "C":
            if(color=="orange" && !coloredButtonC2){
                buttonC.backgroundColor = UIColor.orange
                coloredButtonC2 = true
            } else {
                buttonC.backgroundColor = UIColor.black
                //buttonC.titleLabel?.textColor = UIColor.black
            }
        case "V":
            if(color=="orange" && !coloredButtonV2){
                buttonV.backgroundColor = UIColor.orange
                coloredButtonV2 = true
            } else {
                buttonV.backgroundColor = UIColor.black
                //buttonV.titleLabel?.textColor = UIColor.black
            }
        case "B":
            if(color=="orange" && !coloredButtonB2){
                buttonB.backgroundColor = UIColor.orange
                coloredButtonB2 = true
            } else {
                buttonB.backgroundColor = UIColor.black
                //buttonB.titleLabel?.textColor = UIColor.black
            }
        case "N":
            if(color=="orange" && !coloredButtonN2){
                buttonN.backgroundColor = UIColor.orange
                coloredButtonN2 = true
            } else {
                buttonN.backgroundColor = UIColor.black
                //buttonN.titleLabel?.textColor = UIColor.black
            }
        case "M":
            if(color=="orange" && !coloredButtonM2){
                buttonM.backgroundColor = UIColor.orange
                coloredButtonM2 = true
            } else {
                buttonM.backgroundColor = UIColor.black
                //buttonM.titleLabel?.textColor = UIColor.black
            }
        default:break
            //
        }
    }
    
    
    // Change the focus to the next raw after evaluating the word entered
    func changeFocus(){
        switch numberToFocus {
        case 15:
            numberFocused = 16
            textField15.becomeFirstResponder()
            textField15.layer.borderWidth = 2
        case 21:
            numberFocused = 21
            textField21.becomeFirstResponder()
            textField21.layer.borderWidth = 2
        case 25:
            numberFocused = 26
            textField25.becomeFirstResponder()
            textField25.layer.borderWidth = 2
        case 31:
            numberFocused = 31
            textField31.becomeFirstResponder()
            textField31.layer.borderWidth = 2
        case 35:
            numberFocused = 36
            textField35.becomeFirstResponder()
            textField35.layer.borderWidth = 2
        case 41:
            numberFocused = 41
            textField41.becomeFirstResponder()
            textField41.layer.borderWidth = 2
        case 45:
            numberFocused = 46
            textField45.becomeFirstResponder()
            textField45.layer.borderWidth = 2
        case 51:
            numberFocused = 51
            textField51.becomeFirstResponder()
            textField51.layer.borderWidth = 2
        case 55:
            numberFocused = 56
            textField55.becomeFirstResponder()
            textField55.layer.borderWidth = 2
        case 61:
            numberFocused = 61
            textField61.becomeFirstResponder()
            textField61.layer.borderWidth = 2
        case 65:
            numberFocused = 66
            textField65.becomeFirstResponder()
            textField65.layer.borderWidth = 2
        default: break
            //Nothing to do
        }
    }
    
    // Keyboard button click events
    @IBAction func buttonQ(_ sender: UIButton) {
        letterPrint(letter: "Q")
    }
    @IBAction func buttonW(_ sender: UIButton) {
        letterPrint(letter: "W")
    }
    @IBAction func buttonE(_ sender: UIButton) {
        letterPrint(letter: "E")
    }
    @IBAction func buttonR(_ sender: UIButton) {
        letterPrint(letter: "R")
    }
    @IBAction func buttonT(_ sender: UIButton) {
        letterPrint(letter: "T")
    }
    @IBAction func buttonY(_ sender: UIButton) {
        letterPrint(letter: "Y")
    }
    @IBAction func buttonU(_ sender: UIButton) {
        letterPrint(letter: "U")
    }
    @IBAction func buttonI(_ sender: Any) {
        letterPrint(letter: "I")
    }
    @IBAction func buttonO(_ sender: UIButton) {
        letterPrint(letter: "O")
    }
    @IBAction func buttonP(_ sender: UIButton) {
        letterPrint(letter: "P")
    }
    @IBAction func buttonA(_ sender: UIButton) {
        letterPrint(letter: "A")
    }
    @IBAction func buttonS(_ sender: UIButton) {
        letterPrint(letter: "S")
    }
    @IBAction func buttonD(_ sender: UIButton) {
        letterPrint(letter: "D")
    }
    @IBAction func buttonF(_ sender: UIButton) {
        letterPrint(letter: "F")
    }
    @IBAction func buttonG(_ sender: UIButton) {
        letterPrint(letter: "G")
    }
    @IBAction func buttonH(_ sender: UIButton) {
        letterPrint(letter: "H")
    }
    @IBAction func buttonJ(_ sender: UIButton) {
        letterPrint(letter: "J")
    }
    @IBAction func buttonK(_ sender: UIButton) {
        letterPrint(letter: "K")
    }
    @IBAction func buttonL(_ sender: UIButton) {
        letterPrint(letter: "L")
    }
    @IBAction func buttonZ(_ sender: UIButton) {
        letterPrint(letter: "Z")
    }
    @IBAction func buttonX(_ sender: UIButton) {
        letterPrint(letter: "X")
    }
    @IBAction func buttonC(_ sender: UIButton) {
        letterPrint(letter: "C")
    }
    @IBAction func buttonV(_ sender: UIButton) {
        letterPrint(letter: "V")
    }
    @IBAction func buttonB(_ sender: UIButton) {
        letterPrint(letter: "B")
    }
    @IBAction func buttonN(_ sender: UIButton) {
        letterPrint(letter: "N")
    }
    @IBAction func buttonM(_ sender: UIButton) {
        letterPrint(letter: "M")
    }
    @IBAction func buttonDelete(_ sender: UIButton) {
        deleteButtonClicked()
    }
    
    //Printing the pressed key in the relavent text field
    func letterPrint(letter: String){
        switch numberFocused {
        case 11:
            textField11.text = letter
            numberFocused = 12
            textField12.becomeFirstResponder()
            textField11.layer.borderWidth = 0
            textField12.layer.borderWidth = 2
        case 12:
            textField12.text = letter
            numberFocused = 13
            textField13.becomeFirstResponder()
            textField12.layer.borderWidth = 0
            textField13.layer.borderWidth = 2
        case 13:
            textField13.text = letter
            numberFocused = 14
            textField14.becomeFirstResponder()
            textField13.layer.borderWidth = 0
            textField14.layer.borderWidth = 2
        case 14:
            textField14.text = letter
            numberFocused = 15
            textField15.becomeFirstResponder()
            textField14.layer.borderWidth = 0
            textField15.layer.borderWidth = 2
        case 15:
            if(textField15.text==""){
                textField15.text = letter
            }
            buttonSubmitWord.isEnabled = true
            buttonSubmitEnabled = true
            textField15.layer.borderWidth = 0
            numberToFocus = 21
            guessNumber = 1
        case 21:
            textField21.text = letter
            numberFocused = 22
            textField22.becomeFirstResponder()
            textField21.layer.borderWidth = 0
            textField22.layer.borderWidth = 2
        case 22:
            textField22.text = letter
            numberFocused = 23
            textField23.becomeFirstResponder()
            textField22.layer.borderWidth = 0
            textField23.layer.borderWidth = 2
        case 23:
            textField23.text = letter
            numberFocused = 24
            textField24.becomeFirstResponder()
            textField23.layer.borderWidth = 0
            textField24.layer.borderWidth = 2
        case 24:
            textField24.text = letter
            numberFocused = 25
            textField25.becomeFirstResponder()
            textField24.layer.borderWidth = 0
            textField25.layer.borderWidth = 2
        case 25:
            if(textField25.text==""){
                textField25.text = letter
            }
            buttonSubmitWord.isEnabled = true
            buttonSubmitEnabled = true
            textField25.layer.borderWidth = 0
            numberToFocus = 31
            guessNumber = 2
        case 31:
            textField31.text = letter
            numberFocused = 32
            textField32.becomeFirstResponder()
            textField31.layer.borderWidth = 0
            textField32.layer.borderWidth = 2
        case 32:
            textField32.text = letter
            numberFocused = 33
            textField33.becomeFirstResponder()
            textField32.layer.borderWidth = 0
            textField33.layer.borderWidth = 2
        case 33:
            textField33.text = letter
            numberFocused = 34
            textField34.becomeFirstResponder()
            textField33.layer.borderWidth = 0
            textField34.layer.borderWidth = 2
        case 34:
            textField34.text = letter
            numberFocused = 35
            textField35.becomeFirstResponder()
            textField34.layer.borderWidth = 0
            textField35.layer.borderWidth = 2
        case 35:
            if(textField35.text==""){
                textField35.text = letter
            }
            buttonSubmitWord.isEnabled = true
            buttonSubmitEnabled = true
            textField35.layer.borderWidth = 0
            numberToFocus = 41
            guessNumber = 3
        case 41:
            textField41.text = letter
            numberFocused = 42
            textField42.becomeFirstResponder()
            textField41.layer.borderWidth = 0
            textField42.layer.borderWidth = 2
        case 42:
            textField42.text = letter
            numberFocused = 43
            textField43.becomeFirstResponder()
            textField42.layer.borderWidth = 0
            textField43.layer.borderWidth = 2
        case 43:
            textField43.text = letter
            numberFocused = 44
            textField44.becomeFirstResponder()
            textField43.layer.borderWidth = 0
            textField44.layer.borderWidth = 2
        case 44:
            textField44.text = letter
            numberFocused = 45
            textField45.becomeFirstResponder()
            textField44.layer.borderWidth = 0
            textField45.layer.borderWidth = 2
        case 45:
            if(textField45.text==""){
                textField45.text = letter
            }
            buttonSubmitWord.isEnabled = true
            buttonSubmitEnabled = true
            textField45.layer.borderWidth = 0
            numberToFocus = 51
            guessNumber = 4
        case 51:
            textField51.text = letter
            numberFocused = 52
            textField52.becomeFirstResponder()
            textField51.layer.borderWidth = 0
            textField52.layer.borderWidth = 2
        case 52:
            textField52.text = letter
            numberFocused = 53
            textField53.becomeFirstResponder()
            textField52.layer.borderWidth = 0
            textField53.layer.borderWidth = 2
        case 53:
            textField53.text = letter
            numberFocused = 54
            textField54.becomeFirstResponder()
            textField53.layer.borderWidth = 0
            textField54.layer.borderWidth = 2
        case 54:
            textField54.text = letter
            numberFocused = 55
            textField55.becomeFirstResponder()
            textField54.layer.borderWidth = 0
            textField55.layer.borderWidth = 2
        case 55:
            if(textField55.text==""){
                textField55.text = letter
            }
            buttonSubmitWord.isEnabled = true
            buttonSubmitEnabled = true
            textField55.layer.borderWidth = 0
            numberToFocus = 61
            guessNumber = 5
        case 61:
            textField61.text = letter
            numberFocused = 62
            textField62.becomeFirstResponder()
            textField61.layer.borderWidth = 0
            textField62.layer.borderWidth = 2
        case 62:
            textField62.text = letter
            numberFocused = 63
            textField63.becomeFirstResponder()
            textField62.layer.borderWidth = 0
            textField63.layer.borderWidth = 2
        case 63:
            textField63.text = letter
            numberFocused = 64
            textField64.becomeFirstResponder()
            textField63.layer.borderWidth = 0
            textField64.layer.borderWidth = 2
        case 64:
            textField64.text = letter
            numberFocused = 65
            textField65.becomeFirstResponder()
            textField64.layer.borderWidth = 0
            textField65.layer.borderWidth = 2
        case 65:
            if(textField65.text==""){
                textField65.text = letter
            }
            buttonSubmitWord.isEnabled = true
            buttonSubmitEnabled = true
            textField65.layer.borderWidth = 0
            numberToFocus = 71
            guessNumber = 6
        default: break
            //
        }
    }
    
    // After 6 guesses, reset the game
    func resetGame(){
        numberFocused = 11
        numberToFocus = 0
        guessNumber = 0
        correctGuess = false
        
        randomNumber = Int.random(in: 1..<5)
        
        randomWord = wordsToPresent[randomNumber]
        //randomWord = "DRINK"
        //print("New random word:")
        print(randomWord)
        
        textField11.text = ""
        textField12.text = ""
        textField13.text = ""
        textField14.text = ""
        textField15.text = ""
        textField21.text = ""
        textField22.text = ""
        textField23.text = ""
        textField24.text = ""
        textField25.text = ""
        textField31.text = ""
        textField32.text = ""
        textField33.text = ""
        textField34.text = ""
        textField35.text = ""
        textField41.text = ""
        textField42.text = ""
        textField43.text = ""
        textField44.text = ""
        textField45.text = ""
        textField51.text = ""
        textField52.text = ""
        textField53.text = ""
        textField54.text = ""
        textField55.text = ""
        textField61.text = ""
        textField62.text = ""
        textField63.text = ""
        textField64.text = ""
        textField65.text = ""
        
        textField11.layer.backgroundColor = UIColor.white.cgColor
        textField12.layer.backgroundColor = UIColor.white.cgColor
        textField13.layer.backgroundColor = UIColor.white.cgColor
        textField14.layer.backgroundColor = UIColor.white.cgColor
        textField15.layer.backgroundColor = UIColor.white.cgColor
        textField21.layer.backgroundColor = UIColor.white.cgColor
        textField22.layer.backgroundColor = UIColor.white.cgColor
        textField23.layer.backgroundColor = UIColor.white.cgColor
        textField24.layer.backgroundColor = UIColor.white.cgColor
        textField25.layer.backgroundColor = UIColor.white.cgColor
        textField31.layer.backgroundColor = UIColor.white.cgColor
        textField32.layer.backgroundColor = UIColor.white.cgColor
        textField33.layer.backgroundColor = UIColor.white.cgColor
        textField34.layer.backgroundColor = UIColor.white.cgColor
        textField35.layer.backgroundColor = UIColor.white.cgColor
        textField41.layer.backgroundColor = UIColor.white.cgColor
        textField42.layer.backgroundColor = UIColor.white.cgColor
        textField43.layer.backgroundColor = UIColor.white.cgColor
        textField44.layer.backgroundColor = UIColor.white.cgColor
        textField45.layer.backgroundColor = UIColor.white.cgColor
        textField51.layer.backgroundColor = UIColor.white.cgColor
        textField52.layer.backgroundColor = UIColor.white.cgColor
        textField53.layer.backgroundColor = UIColor.white.cgColor
        textField54.layer.backgroundColor = UIColor.white.cgColor
        textField55.layer.backgroundColor = UIColor.white.cgColor
        textField61.layer.backgroundColor = UIColor.white.cgColor
        textField62.layer.backgroundColor = UIColor.white.cgColor
        textField63.layer.backgroundColor = UIColor.white.cgColor
        textField64.layer.backgroundColor = UIColor.white.cgColor
        textField65.layer.backgroundColor = UIColor.white.cgColor
        
        textField11.textColor = UIColor.black
        textField12.textColor = UIColor.black
        textField13.textColor = UIColor.black
        textField14.textColor = UIColor.black
        textField15.textColor = UIColor.black
        textField21.textColor = UIColor.black
        textField22.textColor = UIColor.black
        textField23.textColor = UIColor.black
        textField24.textColor = UIColor.black
        textField25.textColor = UIColor.black
        textField31.textColor = UIColor.black
        textField32.textColor = UIColor.black
        textField33.textColor = UIColor.black
        textField34.textColor = UIColor.black
        textField35.textColor = UIColor.black
        textField41.textColor = UIColor.black
        textField42.textColor = UIColor.black
        textField43.textColor = UIColor.black
        textField44.textColor = UIColor.black
        textField45.textColor = UIColor.black
        textField51.textColor = UIColor.black
        textField52.textColor = UIColor.black
        textField53.textColor = UIColor.black
        textField54.textColor = UIColor.black
        textField55.textColor = UIColor.black
        textField61.textColor = UIColor.black
        textField62.textColor = UIColor.black
        textField63.textColor = UIColor.black
        textField64.textColor = UIColor.black
        textField65.textColor = UIColor.black
        
        buttonReset()
        
        textField11.becomeFirstResponder()
    }
    
    func buttonReset(){
        buttonQ.backgroundColor = UIColor.lightGray
        buttonQ.titleLabel?.textColor = UIColor.white
        buttonW.backgroundColor = UIColor.lightGray
        buttonW.titleLabel?.textColor = UIColor.white
        buttonE.backgroundColor = UIColor.lightGray
        buttonE.titleLabel?.textColor = UIColor.white
        buttonR.backgroundColor = UIColor.lightGray
        buttonR.titleLabel?.textColor = UIColor.white
        buttonT.backgroundColor = UIColor.lightGray
        buttonT.titleLabel?.textColor = UIColor.white
        buttonY.backgroundColor = UIColor.lightGray
        buttonY.titleLabel?.textColor = UIColor.white
        buttonU.backgroundColor = UIColor.lightGray
        buttonU.titleLabel?.textColor = UIColor.white
        buttonI.backgroundColor = UIColor.lightGray
        buttonI.titleLabel?.textColor = UIColor.white
        buttonO.backgroundColor = UIColor.lightGray
        buttonO.titleLabel?.textColor = UIColor.white
        buttonP.backgroundColor = UIColor.lightGray
        buttonP.titleLabel?.textColor = UIColor.white
        buttonA.backgroundColor = UIColor.lightGray
        buttonA.titleLabel?.textColor = UIColor.white
        buttonS.backgroundColor = UIColor.lightGray
        buttonS.titleLabel?.textColor = UIColor.white
        buttonD.backgroundColor = UIColor.lightGray
        buttonD.titleLabel?.textColor = UIColor.white
        buttonF.backgroundColor = UIColor.lightGray
        buttonF.titleLabel?.textColor = UIColor.white
        buttonG.backgroundColor = UIColor.lightGray
        buttonG.titleLabel?.textColor = UIColor.white
        buttonH.backgroundColor = UIColor.lightGray
        buttonH.titleLabel?.textColor = UIColor.white
        buttonJ.backgroundColor = UIColor.lightGray
        buttonJ.titleLabel?.textColor = UIColor.white
        buttonK.backgroundColor = UIColor.lightGray
        buttonK.titleLabel?.textColor = UIColor.white
        buttonL.backgroundColor = UIColor.lightGray
        buttonL.titleLabel?.textColor = UIColor.white
        buttonZ.backgroundColor = UIColor.lightGray
        buttonZ.titleLabel?.textColor = UIColor.white
        buttonX.backgroundColor = UIColor.lightGray
        buttonX.titleLabel?.textColor = UIColor.white
        buttonC.backgroundColor = UIColor.lightGray
        buttonC.titleLabel?.textColor = UIColor.white
        buttonV.backgroundColor = UIColor.lightGray
        buttonV.titleLabel?.textColor = UIColor.white
        buttonB.backgroundColor = UIColor.lightGray
        buttonB.titleLabel?.textColor = UIColor.white
        buttonN.backgroundColor = UIColor.lightGray
        buttonN.titleLabel?.textColor = UIColor.white
        buttonM.backgroundColor = UIColor.lightGray
        buttonM.titleLabel?.textColor = UIColor.white
        
        coloredButtonQ = false
        coloredButtonW = false
        coloredButtonE = false
        coloredButtonR = false
        coloredButtonT = false
        coloredButtonY = false
        coloredButtonU = false
        coloredButtonI = false
        coloredButtonO = false
        coloredButtonP = false
        coloredButtonA = false
        coloredButtonS = false
        coloredButtonD = false
        coloredButtonF = false
        coloredButtonG = false
        coloredButtonH = false
        coloredButtonJ = false
        coloredButtonK = false
        coloredButtonL = false
        coloredButtonZ = false
        coloredButtonX = false
        coloredButtonC = false
        coloredButtonV = false
        coloredButtonB = false
        coloredButtonN = false
        coloredButtonM = false
    }
    // Do after the delete button clicked
    func deleteButtonClicked(){
        
        if(buttonSubmitEnabled){
            buttonSubmitWord.isEnabled = false
            buttonSubmitEnabled = false
        }
        
        if(numberFocused==11 || numberFocused==21 || numberFocused==31 || numberFocused==41 || numberFocused==51 || numberFocused==61 || numberToFocus==21 || numberToFocus==31 || numberToFocus==41 || numberToFocus==51 || numberToFocus==61 || numberToFocus==71){
            numberToFocus = 0
        } else {
        numberFocused = numberFocused - 1
        }
        
        switch numberFocused {
        case 11:
            textField11.text = ""
            textField11.becomeFirstResponder()
            textField12.layer.borderWidth = 0
            textField11.layer.borderWidth = 2
        case 12:
            textField12.text = ""
            textField12.becomeFirstResponder()
            textField13.layer.borderWidth = 0
            textField12.layer.borderWidth = 2
        case 13:
            textField13.text = ""
            textField13.becomeFirstResponder()
            textField14.layer.borderWidth = 0
            textField13.layer.borderWidth = 2
        case 14:
            textField14.text = ""
            textField14.becomeFirstResponder()
            textField15.layer.borderWidth = 0
            textField14.layer.borderWidth = 2
        case 15:
            textField15.text = ""
            textField15.becomeFirstResponder()
            textField15.layer.borderWidth = 2
        case 21:
            textField21.text = ""
            textField21.becomeFirstResponder()
            textField22.layer.borderWidth = 0
            textField21.layer.borderWidth = 2
        case 22:
            textField22.text = ""
            textField22.becomeFirstResponder()
            textField23.layer.borderWidth = 0
            textField22.layer.borderWidth = 2
        case 23:
            textField23.text = ""
            textField23.becomeFirstResponder()
            textField24.layer.borderWidth = 0
            textField23.layer.borderWidth = 2
        case 24:
            textField24.text = ""
            textField24.becomeFirstResponder()
            textField25.layer.borderWidth = 0
            textField24.layer.borderWidth = 2
        case 25:
            textField25.text = ""
            textField25.becomeFirstResponder()
            textField25.layer.borderWidth = 2
        case 31:
            textField31.text = ""
            textField31.becomeFirstResponder()
            textField32.layer.borderWidth = 0
            textField31.layer.borderWidth = 2
        case 32:
            textField32.text = ""
            textField32.becomeFirstResponder()
            textField33.layer.borderWidth = 0
            textField32.layer.borderWidth = 2
        case 33:
            textField33.text = ""
            textField33.becomeFirstResponder()
            textField34.layer.borderWidth = 0
            textField33.layer.borderWidth = 2
        case 34:
            textField34.text = ""
            textField34.becomeFirstResponder()
            textField35.layer.borderWidth = 0
            textField34.layer.borderWidth = 2
        case 35:
            textField35.text = ""
            textField35.becomeFirstResponder()
            textField35.layer.borderWidth = 2
        case 41:
            textField41.text = ""
            textField41.becomeFirstResponder()
            textField42.layer.borderWidth = 0
            textField41.layer.borderWidth = 2
        case 42:
            textField42.text = ""
            textField42.becomeFirstResponder()
            textField43.layer.borderWidth = 0
            textField42.layer.borderWidth = 2
        case 43:
            textField43.text = ""
            textField43.becomeFirstResponder()
            textField44.layer.borderWidth = 0
            textField43.layer.borderWidth = 2
        case 44:
            textField44.text = ""
            textField44.becomeFirstResponder()
            textField45.layer.borderWidth = 0
            textField44.layer.borderWidth = 2
        case 45:
            textField45.text = ""
            textField45.becomeFirstResponder()
            textField45.layer.borderWidth = 2
        case 51:
            textField51.text = ""
            textField51.becomeFirstResponder()
            textField52.layer.borderWidth = 0
            textField51.layer.borderWidth = 2
        case 52:
            textField52.text = ""
            textField52.becomeFirstResponder()
            textField53.layer.borderWidth = 0
            textField52.layer.borderWidth = 2
        case 53:
            textField53.text = ""
            textField53.becomeFirstResponder()
            textField54.layer.borderWidth = 0
            textField53.layer.borderWidth = 2
        case 54:
            textField54.text = ""
            textField54.becomeFirstResponder()
            textField55.layer.borderWidth = 0
            textField54.layer.borderWidth = 2
        case 55:
            textField55.text = ""
            textField55.becomeFirstResponder()
            textField55.layer.borderWidth = 2
        case 61:
            textField61.text = ""
            textField61.becomeFirstResponder()
            textField62.layer.borderWidth = 0
            textField61.layer.borderWidth = 2
        case 62:
            textField62.text = ""
            textField62.becomeFirstResponder()
            textField63.layer.borderWidth = 0
            textField62.layer.borderWidth = 2
        case 63:
            textField63.text = ""
            textField63.becomeFirstResponder()
            textField64.layer.borderWidth = 0
            textField63.layer.borderWidth = 2
        case 64:
            textField64.text = ""
            textField64.becomeFirstResponder()
            textField65.layer.borderWidth = 0
            textField64.layer.borderWidth = 2
        case 65:
            textField65.text = ""
            textField65.becomeFirstResponder()
            textField65.layer.borderWidth = 2
        default: break
            //
        }
    }
    
    // Disable the text fields at the loading state
    func disableTextFields(){
        textField11.isEnabled = false
        textField12.isEnabled = false
        textField13.isEnabled = false
        textField14.isEnabled = false
        textField15.isEnabled = false
        textField21.isEnabled = false
        textField22.isEnabled = false
        textField23.isEnabled = false
        textField24.isEnabled = false
        textField25.isEnabled = false
        textField31.isEnabled = false
        textField32.isEnabled = false
        textField33.isEnabled = false
        textField34.isEnabled = false
        textField35.isEnabled = false
        textField41.isEnabled = false
        textField42.isEnabled = false
        textField43.isEnabled = false
        textField44.isEnabled = false
        textField45.isEnabled = false
        textField51.isEnabled = false
        textField52.isEnabled = false
        textField53.isEnabled = false
        textField54.isEnabled = false
        textField55.isEnabled = false
        textField61.isEnabled = false
        textField62.isEnabled = false
        textField63.isEnabled = false
        textField64.isEnabled = false
        textField65.isEnabled = false
    }
}

