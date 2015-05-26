//
//  ComputerGame.swift
//  SwiftNumberGuesser
//
//  Created by John Dyer on 02/04/2015.
//  Copyright (c) 2015 John Dyer. All rights reserved.
//

import UIKit

class ComputerGame: UIViewController {
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var visHighButton: UIButton!
    @IBOutlet weak var visLowButton: UIButton!
    
    var answerNumber = 0
    var prevGuess = 0
    var currentGuess = 0
    var answerLength = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = String(answerNumber)
        
        var tmpNumber = answerNumber
        while tmpNumber > 10
        {
            answerLength++
            tmpNumber = tmpNumber / 10
        }
        updateGuess("start")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func highButton(sender: AnyObject)
    {
       updateGuess("high")
    }
    
    @IBAction func lowButton(sender: AnyObject)
    {
        updateGuess("low")
    }
    
    func updateGuess(direction: String)
    {
        var tmpNum = currentGuess
        switch direction
        {
        case "start":
            currentGuess = Int(pow(10.0, Float(answerLength)) / 2)
            prevGuess = Int(pow(10.0, Float(answerLength)))
        case "high":
            currentGuess = currentGuess - (abs((prevGuess - currentGuess)) / 2)
            prevGuess = tmpNum
            if(currentGuess == prevGuess){currentGuess--}
        case "low":
            currentGuess = (abs((prevGuess - currentGuess)) / 2) + currentGuess
            prevGuess = tmpNum
            if(currentGuess == prevGuess){currentGuess++}
        default:
            println("Error")
        }
        guessLabel.text = String(currentGuess)
        
        if(currentGuess == answerNumber)
        {
            let alertController = UIAlertController(title: "Number Guesser", message:
                "I've guessed your number", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            visHighButton.hidden = true
            visLowButton.hidden = true
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
