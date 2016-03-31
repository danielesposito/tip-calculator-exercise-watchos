//
//  InterfaceController.swift
//  Tip Calculator wOS Extension
//
//  Created by Daniel Esposito on 3/30/16.
//  Copyright © 2016 Daniel Esposito. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet var tenPercentBtn: WKInterfaceButton!
    @IBOutlet var fifteenPercentBtn: WKInterfaceButton!
    @IBOutlet var twentyPercentBtn: WKInterfaceButton!
    @IBOutlet var costOfMealLabel: WKInterfaceLabel!
    @IBOutlet var tipPercentageBtn: WKInterfaceButton!
    
    var mealCost: Int = 0
    
    var mealCost5Incrment: Int = 0
    var mealCost1Incrment: Int = 0
    var finalValueMealCost: Int = 0
    var tipPercentage: Int = 0
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func slider5IncrementPressed(value: Int) {
        mealCost5Incrment = value
        totalMealCostUpdate()
    
    }
    
    @IBAction func slieder1IncrementPressed(value: Int) {
//        costOfMealLabel.setText("\(value) BHT")
        mealCost1Incrment = value
        totalMealCostUpdate()
    }
    @IBAction func tipPercentageSlider(value: Int) {
        
        tipPercentage = value
        tipPercentageBtn.setTitle("\(tipPercentage)%")
        
    }
    
    @IBAction func btn10Tapped() {
        self.pushControllerWithName("calculatedController", context: ["costOfMeal": 65, "tipPercentage": 10, "mealCost": finalValueMealCost])
    }
    @IBAction func btn15Tapped() {
        self.pushControllerWithName("calculatedController", context: ["costOfMeal": 65, "tipPercentage": 15, "mealCost": finalValueMealCost])
    }
    @IBAction func btn20Tapped() {
        self.pushControllerWithName("calculatedController", context: ["costOfMeal": 65, "tipPercentage": 20,"mealCost": finalValueMealCost])
    }
    
    @IBAction func tipBtnPressed() {
        
        if isTipPercentageLessThan4(tipPercentage) {
            
            self.pushControllerWithName("calculatedController", context: ["tipPercentage": tipPercentage,"mealCost": finalValueMealCost])
        } else {
            
            tipPercentageBtn.setTitle("Min 5%!")
        }
        
    
    }
    
    
    func isTipPercentageLessThan4(value: Int) -> Bool {
        
        if value <= 4 {
            return false
        } else {
            return true
        }
    }
    
    func totalMealCostUpdate(){
//        xxc + mealCost5Incrment
//        xxxc + mealCost1Incrment
        let value = mealCost5Incrment
        let value2 = mealCost1Incrment
        finalValueMealCost = value + value2
        costOfMealLabel.setText("\(finalValueMealCost) BHT")
        print(value2)
        print(value)
    }
    
}


