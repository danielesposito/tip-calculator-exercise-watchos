//
//  CalculatedResultsController.swift
//  Tip Calculator
//
//  Created by Daniel Esposito on 3/30/16.
//  Copyright © 2016 Daniel Esposito. All rights reserved.
//

import WatchKit
import Foundation


class CalculatedResultsController: WKInterfaceController {

    @IBOutlet var rslMealCostLabel: WKInterfaceLabel!
    @IBOutlet var rslTipCostLable: WKInterfaceLabel!
    @IBOutlet var rslTipAmountLabel: WKInterfaceLabel!
    @IBOutlet var rslTotalCostLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var dict = context as! [String:Int]
        
        let mealCost = Float(dict["mealCost"]!)
        let tipPercentage = dict["tipPercentage"]!
        let tipPercentageCal = Float(mealCost) * Float(tipPercentage) / 100
        let totalCostAmount = Float(mealCost) + Float(tipPercentageCal)
        rslTipAmountLabel.setText("Tip \(dict["tipPercentage"]!)%")
        rslTipCostLable.setText("\(tipPercentageCal) BHT")
        rslMealCostLabel.setText("\(mealCost) BHT")
        rslTotalCostLabel.setText("\(totalCostAmount) BHT")
        
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
//        rslTipCostLable.setText("B1000")
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
