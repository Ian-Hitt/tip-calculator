//
//  TipCalculatorViewController.swift
//  Tip Calculator
//
//  Created by Adam Page on 3/24/20.
//  Copyright © 2020 Adam Page. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController,UITextFieldDelegate
{
 
    @IBOutlet weak var amountBeforeTaxTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var eachPersonAmountLabel: UILabel!
   @IBOutlet weak var totalResultLabel: UILabel!
    
    var tipCalculator = TipCalculator(amountBeforeTax: 0, tipPercentage: 0.10)
    
    override func viewDidLoad() {
          super.viewDidLoad()
        
        amountBeforeTaxTextField.becomeFirstResponder()
      }
    
    //Hide Keyboard
      override func touchesBegan(_ touches: Set<UITouch> , with event: UIEvent?){
          self.view.endEditing(true)
      }
      //press return key
      func textFieldShouldReturn( _ textField: UITextField) -> Bool {
          textField.resignFirstResponder()
          return(true)
      }
    
    func calculateBill() {
        tipCalculator.tipPercentage = Double(tipPercentageSlider.value) / 100.0
        tipCalculator.amountBeforeTax = (amountBeforeTaxTextField.text! as NSString).doubleValue
        tipCalculator.calculateTip()
        updateUI()
    }
    func updateUI(){
        totalResultLabel.text = String( format: "$%0.2f", tipCalculator.totalAmount)
        let numberOfPeople: Int = Int (numberOfPeopleSlider.value)
        eachPersonAmountLabel.text = String(format: "$&0.2f", tipCalculator.totalAmount / Double(numberOfPeople))
    }
   
    
    //Mark: - Target / Action
    
  
    @IBAction func tipSlidervalueChanged(sender: Any){
        tipPercentageLabel.text = String(format: "Tip: %02d%%", Int(tipPercentageSlider.value ))
        calculateBill()
    }
    //having issues with this line
    @IBAction func numberOfPeopleSliderValueChanged(sender: Any){
        numberOfPeopleLabel.text = "Split: \(Int(numberOfPeopleSlider.value))"
        calculateBill()
    }
    
    
    @IBAction func anountBeforetaxTextFieldChanged(sender: Any){
        calculateBill()
    }
}
