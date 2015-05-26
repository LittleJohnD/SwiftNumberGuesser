
//
//  HumanGame.swift
//  SwiftNumberGuesser
//
//  Created by John Dyer on 02/04/2015.
//  Copyright (c) 2015 John Dyer. All rights reserved.
//

import UIKit

class HumanGame: UIViewController {

    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var isLabel: UILabel!
    @IBOutlet weak var dirLabel: UILabel!
    @IBOutlet weak var guessEntry: UITextField!
    @IBOutlet weak var newGuessLabel: UILabel!
    var currentGuess = 0
    var answerLength = 1
    var answerNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //Int(arc4random(
        answerNumber = Int(arc4random_uniform(UInt32(pow(10.0, Float(answerLength)))))
        println(answerNumber)
        guessLabel.hidden = true
        isLabel.hidden = true
        dirLabel.hidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func textFieldShouldReturn(guessEntry: UITextField) -> Bool
    {
        currentGuess = guessEntry.text.toInt()!
        guessEntry.resignFirstResponder()
        checkGuess()
        return true
    }
    
    func checkGuess()
    {
        guessLabel.text = String(currentGuess)
        if(currentGuess < answerNumber)
        {
            guessLabel.hidden = false
            isLabel.hidden = false
            dirLabel.text = "too low"
            dirLabel.hidden = false
        }
        else if(currentGuess > answerNumber)
        {
            guessLabel.hidden = false
            isLabel.hidden = false
            dirLabel.text = "too high"
            dirLabel.hidden = false
        }
        else if(currentGuess == answerNumber)
        {
            guessLabel.hidden = true
            isLabel.hidden = true
            dirLabel.hidden = true
            let alertController = UIAlertController(title: "Number Guesser", message:
                "You have guessed my number", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            newGuessLabel.hidden = true
            guessEntry.hidden = true
        }
        guessEntry.text = ""
    }

}
