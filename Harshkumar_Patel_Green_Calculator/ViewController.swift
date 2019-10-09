//
//  ViewController.swift
//  Harshkumar_Patel_Green_Calculator
//
//  Created by Harshkumar Patel on 2019-09-11.
//  Copyright © 2019 Harshkumar Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    

    @IBOutlet weak var numberDisplay: UITextField!
    var startNumber = true
    
    //Model instance to call
    var calculatorModel=HarshKumar_Calculator_Model()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //IBActions
    
    @IBAction func clearButtontouch(_ sender: UIButton) {
    print("Done!!!!")
    print(sender.currentTitle!)
    
        let buttonText=sender.currentTitle!
        var currentValue=numberDisplay.text!
        
        switch (buttonText){
        case"0","1","2","3","4","5","6","7","8","9",".":
        print(buttonText)
        if(startNumber){
            if(buttonText=="."){
                currentValue = "0."
            }
            else{
                currentValue=buttonText
                }
        }else{
            if(buttonText == "."){
                if(currentValue.contains(".")){
                    
            }else{
                currentValue = currentValue + buttonText
                }
        }else{
            currentValue = currentValue + buttonText
            }
        }
        startNumber=false
        calculatorModel.updateNumber(newNumber: Double(currentValue)!)
            
        case"+","-","*","/":
            if(calculatorModel.secondNumber != nil){
            
            currentValue=String(calculatorModel.getResult())
                calculatorModel.reset()
                calculatorModel.updateNumber(newNumber: Double(currentValue)!)
            
            }
            calculatorModel.operation=buttonText
            //accept the second number after the opertion
            startNumber=true
            
       
        case "=":
            if(calculatorModel.secondNumber==nil){
            calculatorModel.updateNumber(newNumber: Double(currentValue)!)
            
            }//get the result to the field
            currentValue=String(calculatorModel.getResult())
            startNumber=true
            
            case "C":
            currentValue="0"
            calculatorModel.reset()
            startNumber=true
        default:
            print(buttonText)
        }
        numberDisplay.text=currentValue
    }
    
}


