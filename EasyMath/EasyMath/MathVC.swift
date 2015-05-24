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
    
    var firstNumber: Int?
    var secondNumber: Int?
    var additionMathValueCheck: Int?
    var additionMathInput: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        validationLabel.text = ""
        
        firstNumber = assignRandomNumber(10)
        secondNumber = assignRandomNumber(10)
        
        firstNumberLabel.text = convertNumberToString(firstNumber!)
        secondNumberLabel.text = convertNumberToString(secondNumber!)
        
        additionMathValueCheck! = additionMathCheck(firstNumber!, secondNumber: secondNumber!)
        
        println(additionMathValueCheck!)
    }
    
    func assignRandomNumber(maxDigit: UInt32) -> Int {
        var randomNumber = arc4random_uniform(maxDigit)
        
        return Int(randomNumber)
    }
    
    func additionMathCheck(firstNumber: Int, secondNumber: Int) -> Int {
        additionMathValueCheck = firstNumber + secondNumber
        return additionMathValueCheck!
    }
    
    func convertNumberToString(number: Int) -> String {
        return String(number)
    }
    
    func convertStringToInt(stringInput: String) -> Int {        
        return stringInput.toInt()!
    }
    
    @IBAction func checkAnswer(sender: AnyObject) {
        
        if answerField.text == "" {
            answerField.text = "0"
        }
        
        additionMathInput = convertStringToInt(answerField.text)
        
        if additionMathInput! == additionMathValueCheck {
            validationLabel.text = "Correct!"
        }
        else {
            validationLabel.text = "Incorrect."
        }
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

}
