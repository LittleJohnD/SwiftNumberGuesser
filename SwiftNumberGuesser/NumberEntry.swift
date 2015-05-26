//
//  NumberEntry.swift
//  SwiftNumberGuesser
//
//  Created by John Dyer on 02/04/2015.
//  Copyright (c) 2015 John Dyer. All rights reserved.
//

import UIKit

class NumberEntry: UIViewController {

    @IBOutlet weak var answerEntry: UITextField!
    var answerNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(answerEntry: UITextField) -> Bool
    {
        answerNumber = answerEntry.text.toInt()!
        answerEntry.resignFirstResponder()
        return true
    }
    
    @IBAction func beginGame(sender: AnyObject) {
        answerNumber = answerEntry.text.toInt()!
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        var cGame = segue.destinationViewController as ComputerGame
        cGame.answerNumber = answerNumber
    }

}
