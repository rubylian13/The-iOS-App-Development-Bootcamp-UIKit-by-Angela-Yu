//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Ruby Lien on 2022/11/14.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
        
        /*
        if let safeBMI = bmi {
            let bmiTo1DecimalPlace = String(format: "%.1f", safeBMI)
            return bmiTo1DecimalPlace
        } else {
            return "0.0"
        }
        */
         
        /*
        if bmi != nil {
            let bmiTo1DecimalPlace = String(format: "%.1f", bmi!)
            return bmiTo1DecimalPlace
        } else {
            return "0.0"
        }
         */
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Underweight", color: UIColor.blue)
//            print("Underweight")
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "normal weight", color: UIColor.green)
//            print("normal weight")
        } else {
            bmi = BMI(value: bmiValue, advice: "overweight", color: UIColor.red)
//            print("overweight")
        }
        
//        bmi = BMI(value: <#T##Float#>, advice: <#T##String#>, color: <#T##UIColor#>)
        
    }
}
