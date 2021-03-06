//
//  MathVC.swift
//  EasyMath
//
//  Created by Matthew Curtner on 5/24/15.
//  Copyright (c) 2015 Matthew Curtner. All rights reserved.
//

import Foundation
import UIKit

class MathVC: UIViewController {
    
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!
    @IBOutlet weak var answerField: UITextField!
    @IBOutlet weak var answerCheckBtn: UIButton!
    @IBOutlet weak var validationLabel: UILabel!
    
    var maxDigitRandomNumber: Int!
    var firstNumber: Int?
    var secondNumber: Int?
    var additionMathValueCheck: Int?
    var additionMathInput: Int?
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        displayMathProblem()
    }
    
    //Assign a random number based on the passed max digit
    func assignRandomNumber(maxDigit: UInt32) -> Int {
        var randomNumber = arc4random_uniform(maxDigit)
        
        return Int(randomNumber)
    }
    
    //Display the generated numbers
    func displayMathProblem() {
        validationLabel.text = ""
        answerField.text = ""
        
        firstNumber = assignRandomNumber(UInt32(maxDigitRandomNumber))
        secondNumber = assignRandomNumber(UInt32(maxDigitRandomNumber))
        
        firstNumberLabel.text = convertNumberToString(firstNumber!)
        secondNumberLabel.text = convertNumberToString(secondNumber!)
        
        additionMathValueCheck! = additionMathCheck(firstNumber!, secondNumber: secondNumber!)
    }
    
    
    //Add the two numbers and return the answer
    func additionMathCheck(firstNumber: Int, secondNumber: Int) -> Int {
        additionMathValueCheck = firstNumber + secondNumber
        return additionMathValueCheck!
    }
    
    //Convert the number to String
    func convertNumberToString(number: Int) -> String {
        return String(number)
    }
    
    //Convert the string to Int value
    func convertStringToInt(stringInput: String) -> Int {        
        return stringInput.toInt()!
    }
    
    //Check if the provided answer matches the math
    @IBAction func checkAnswer(sender: AnyObject) {
        
        if answerField.text == "" {
            answerField.text = "0"
        }
        
        additionMathInput = convertStringToInt(answerField.text)
        
        if additionMathInput! == additionMathValueCheck {
            validationLabel.text = "Correct!"
            
            let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC * 2))
            dispatch_after(delayTime, dispatch_get_main_queue()){
                self.displayMathProblem()
            }
            
        }
        else {
            validationLabel.text = "Incorrect."
        }
    }
    
    //Dismiss keyboard on background touch.
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

}
