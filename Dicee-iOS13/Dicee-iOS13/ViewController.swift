//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    var leftDiceNumber = 1
    var rightDiceNumber = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // who.what = value
        // #imageLiteral(
//        diceImageView1.image = #imageLiteral(resourceName: "DiceSix")
//        diceImageView2.image = #imageLiteral(resourceName: "DiceTwo")
        
//        diceImageView1.alpha = 0.5
        
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
//        print("Button got tapped.")
//        diceImageView1.image = #imageLiteral(resourceName: "DiceFour")
//        diceImageView2.image = #imageLiteral(resourceName: "DiceFour")
        
        /*
         // show 1,2 1,2 1,2...not change to 3,4,5,6
         
         var leftDiceNumber = 1
         // leftDiceNumber = 1
         print("leftDiceNumber at beginning = \(leftDiceNumber)")
         
         diceImageView1.image = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")] [leftDiceNumber]
         
         leftDiceNumber = leftDiceNumber + 1
         // leftDiceNumber = 2
         print("leftDiceNumber at the end = \(leftDiceNumber)")
         */
        print(leftDiceNumber)
        
//        diceImageView1.image = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")] [Int.random(in: 0...5)]
//        diceImageView2.image = [#imageLiteral(resourceName: "DiceSix"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceOne")] [Int.random(in: 0...5)]
        let diceArray = [#imageLiteral(resourceName: "DiceSix"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceOne")] // 常數
        
//        diceImageView1.image = diceArray[Int.random(in: 0...5)]
//        diceImageView2.image = diceArray[Int.random(in: 0...5)]
        
        diceImageView1.image = diceArray.randomElement() // random pick in in special range
        diceImageView2.image = diceArray.randomElement()
        
        leftDiceNumber += 1
        rightDiceNumber -= 1
        
        print(leftDiceNumber)
    }
    
}

