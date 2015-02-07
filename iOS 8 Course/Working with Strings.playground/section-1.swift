// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var anotherStr = "Oscar"

var thirdStr = str + anotherStr

for Character in str {
    println(Character)
}

var newString = "Test String" as NSString

var subString = (str as NSString).substringToIndex(6)     // displays the first 6

var endingString = newString.substringFromIndex(3)   // removes first 3

var anotherString = newString.substringWithRange(NSRange(location: 5, length: 4))  // range

if newString.containsString("Test") {
    println("Contains test")
}

newString.componentsSeparatedByString(" ")   // creates array

newString.uppercaseString    // capitalizes everything

newString.lowercaseString    // lowercases everything