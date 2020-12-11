//
//  ViewController.swift
//  Calculator-Swift
//
//  Created by Dayton on 11/12/20.
//

import UIKit

class ViewController: UIViewController {
    private var isFinishedTypingNumber:Bool = true
    
    private var displayValue:Double {
        get{
    // guard our variable and if we can't convert String to Double successfully and turn to non-optional, do something
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double")
            }
            
            return number
            
        }set {
            displayLabel.text = String(newValue)
        }
    }
    private var calculator = CalculatorLogic()
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
       
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle{
            
            if let result = calculator.calculate(symbol: calcMethod)  {
            displayValue = result
            }
            
           
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle{
            
            if isFinishedTypingNumber {
                //Reset label for the first&Second operation number and will be able to add more integer
                displayLabel.text = numValue
                isFinishedTypingNumber = false
                
            }else {
                
                if numValue == "." {
                    //round down everything inside the label, and checking if its equal to the current Display label
                    //if it is int it will work, if it is already decimal then it can't work because it is already decimal
                    
                    //if it is true then proceed out of this if statement and add the "." sign
                    let isInt = floor(displayValue) == displayValue
                    
                    //if it is false, or already a decimal return the func and can't add "."
                    if !isInt {
                        return
                    }
                }
                
                //appending integer to the label
                displayLabel.text = displayLabel.text! + numValue
            }
        }
       
        
    }

}

