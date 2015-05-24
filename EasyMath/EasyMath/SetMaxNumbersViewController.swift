//
//  SetMaxNumbersViewController.swift
//  EasyMath
//
//  Created by Matthew Curtner on 5/24/15.
//  Copyright (c) 2015 Matthew Curtner. All rights reserved.
//

import UIKit

class SetMaxNumbersViewController: UIViewController {

    @IBOutlet weak var maxDigitNumber: UISegmentedControl!
    var segmentNumber: String!
    
    
    required init(coder aDecoder: NSCoder) {
        self.segmentNumber = "10"
        super.init(coder: aDecoder)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func setMaxDigitSegement(sender: AnyObject) {
        switch sender.selectedSegmentIndex {
        case 0:
            segmentNumber = "10"
        case 1:
            self.segmentNumber = "20"
        case 2:
            segmentNumber = "30"
        case 3:
            segmentNumber = "50"
        case 4:
            segmentNumber = "100"
        default:
            segmentNumber = "10"
            break
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "addition" {
            var vc: MathVC = segue.destinationViewController as! MathVC
            vc.maxDigitRandomNumber = segmentNumber.toInt()
        }
        if segue.identifier == "subtraction" {
            var vc: SubtractionViewController = segue.destinationViewController as! SubtractionViewController
            vc.maxDigitRandomNumber = segmentNumber.toInt()
        }

    }
    
}
