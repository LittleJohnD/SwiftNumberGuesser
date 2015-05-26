//
//  DifficultyEntry.swift
//  SwiftNumberGuesser
//
//  Created by John Dyer on 14/04/2015.
//  Copyright (c) 2015 John Dyer. All rights reserved.
//

import UIKit

class DifficultyEntry: UIViewController {

    @IBOutlet weak var stepperButton: UIStepper!
    @IBOutlet weak var diffLabel: UILabel!
    var diffNum = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        stepperButton.wraps = true
        stepperButton.minimumValue = 1
        stepperButton.maximumValue = 7
        stepperButton.autorepeat = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func stepperChange(sender: UIStepper) {
        diffNum = Int(sender.value)
        diffLabel.text = String(diffNum)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        var hGame = segue.destinationViewController as HumanGame
        hGame.answerLength = diffNum
        
    }

}
