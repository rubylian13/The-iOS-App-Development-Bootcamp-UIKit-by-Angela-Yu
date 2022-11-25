//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
//        print(sender.value)
//        print(String(format: "%.2f", sender.value)) // 四捨五入取小數2位
//        heightLabel.text = String(format: "%.2f", sender.value)
        let height = String(format: "%.2f", sender.value) // 四捨五入取小數2位
        heightLabel.text = "\(height)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
//        print(sender.value)
//        print(String(format: "%.0f", sender.value)) // 四捨五入取整數
//        print(Int(sender.value)) // 取整數
//        weightLabel.text = String(format: "%.0f", sender.value)
        let weight = String(format: "%.0f", sender.value) // 四捨五入取整數
        weightLabel.text = "\(weight)Kg"
    }
        
    @IBAction func calculatePressed(_ sender: UIButton) {
//        print(heightSlider.value)
//        print(weightSlider.value)
        let height = heightSlider.value
        let weight = weightSlider.value
        
//        let bmi = weight / pow(height, 2)
//        print(bmi)
//        bmiValue = String(format: "%.1f",bmi)
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController // downcasting
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

