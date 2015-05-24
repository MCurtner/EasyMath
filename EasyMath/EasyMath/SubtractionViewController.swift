//
//  SubtractionViewController.swift
//  EasyMath
//
//  Created by Matthew Curtner on 5/24/15.
//  Copyright (c) 2015 Matthew Curtner. All rights reserved.
//

import Foundation
import UIKit

class SubtractionViewController: UIViewController {

    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!
    @IBOutlet weak var answerField: UITextField!
    @IBOutlet weak var answerCheckBtn: UIButton!
    @IBOutlet weak var validationLabel: UILabel!
    
    var maxDigitRandomNumber: Int!
    var firstNumber: Int?
    var secondNumber: Int?
    var subtractionMathValueCheck: Int?
    var subtractionMathInput: Int?
    
    
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
        
        //Check if firstNumber is greater than or equal to second number
        if firstNumber >= secondNumber {
            firstNumberLabel.text = convertNumberToString(firstNumber!)
            secondNumberLabel.text = convertNumberToString(secondNumber!)
        } else {
            //If second number is smaller than the firstNumber,
            //run the random number again.
            firstNumber = assignRandomNumber(UInt32(maxDigitRandomNumber))
            secondNumber = assignRandomNumber(UInt32(maxDigitRandomNumber))
        }
        

        firstNumberLabel.text = convertNumberToString(firstNumber!)
        secondNumberLabel.text = convertNumberToString(secondNumber!)
        
        subtractionMathValueCheck! = subtractionMathCheck(firstNumber!, secondNumber: secondNumber!)
    }
    
    
    //Add the two numbers and return the answer
    func subtractionMathCheck(firstNumber: Int, secondNumber: Int) -> Int {
        subtractionMathValueCheck = firstNumber - secondNumber
        return subtractionMathValueCheck!
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
        
        subtractionMathInput = convertStringToInt(answerField.text)
        
        if subtractionMathInput! == subtractionMathValueCheck {
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
