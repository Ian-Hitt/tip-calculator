//
//  TipCalculator.swift
//  Tip Calculator
//
//  Created by Alan Getty on 3/24/20.
//  Copyright © 2020 Adam Page. All rights reserved.
//

import Foundation

class TipCalculator{
    var amountBeforeTax: Double = 0
    var tipAmount: Double = 0
    var tipPercentage: Double = 0
    var totalAmount: Double = 0
    
    init(amountBeforeTax: Double, tipPercentage: Double){
        self.amountBeforeTax = amountBeforeTax
        self.tipPercentage = tipPercentage
    }
    func calculateTip(){
        tipAmount = amountBeforeTax * tipPercentage
        totalAmount = tipAmount + amountBeforeTax
    }
    
}
