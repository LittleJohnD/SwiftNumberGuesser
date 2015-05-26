/*
 * A Playground version of SwiftNumberGuesser written for Rook 2015
 */

import UIKit

//Change answer here
let answerNumber = 67
//currentGuess starts as half of maximum (100)
var currentGuess = 50
//previousGuess starts as the maxium(100)
var previousGuess = 100
var temporyNumber = 0
var inputNumbers:(Int,Int)

while currentGuess != answerNumber
{
    temporyNumber = currentGuess
    if currentGuess > answerNumber
    {
        currentGuess = currentGuess - (abs((previousGuess - currentGuess)) / 2)
        previousGuess = temporyNumber
        if(currentGuess == previousGuess){currentGuess--}
    }
    else
    {
        currentGuess = (abs((previousGuess - currentGuess)) / 2) + currentGuess
        previousGuess = temporyNumber
        if(currentGuess == previousGuess){currentGuess++}
    }
    
}

func guessNumber(numberTarget: Int, maximumNumber: Int)
{
    var currentNumber:Int = maximumNumber / 2
    var previousNumber:Int = maximumNumber
    var tmpNum = 0
    while currentNumber != numberTarget
    {
        tmpNum = currentNumber
        if currentNumber > numberTarget
        {
            currentNumber = currentNumber - differnce(previousNumber, currentNumber)
            previousNumber = tmpNum
            if(currentNumber == previousNumber){currentNumber--}
        }
        else
        {
            currentNumber = differnce(previousNumber, currentNumber)
 + currentNumber
            previousNumber = tmpNum
            if(currentNumber == previousNumber){currentNumber++}
        }
    }
}

func differnce(num1: Int, num2: Int) -> Int
{
    return (abs((num1 - num2)) / 2)
}


inputNumbers = (38,100)
guessNumber(inputNumbers.0,inputNumbers.1)
