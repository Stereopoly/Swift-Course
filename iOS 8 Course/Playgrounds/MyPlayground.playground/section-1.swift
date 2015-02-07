////// Playground - noun: a place where people can play
////
////import UIKit
////
////var str = "Hello, playground and more"
////
////str = "Goodbye"
////
////var name:String = "Oscar"
////
////name = "Oscar Bjorkman"
////
////var unknownString:String  // specify when var doesn't have initial value
////
////unknownString = "My string"
////
////var int = 4
////
////3 * int
////
////var a = 5
////var b = a * 3
////
////var c:Double = 5 / 2
////
////c * Double(int)   // Double() converts the number in the parenthesis to Double
////
////var longSentence = str + " " + name
////
////var newString = "Hello: \(int)"     // variable name sits in parenthesis
////
////
////var f = 3.5
////var d = 4
////var e = 14
////
////
////var answer = "\(f) times \(d) = \(e)"
////
////
////
////var arr = [1, 2, 3, 4, 5]     // array
////
////arr[2]
////
////arr.append(6)   // adds value to end
////
////println(arr)
////
////arr.removeAtIndex(2)   // removes 3rd item
////
////
////println(arr)
////
////arr.removeLast()   // removes last one
////
////println(arr)
////
////arr.removeRange(1...2)   // removes those elements
////
////var newArr = [1, 2.3, "hi"]    // arrays can have variables with different types
////
////var emptyArr:[Int]
////
////var dict = ["Name": "Oscar", "Age": 14, "Gender": "Male"]
////
////println(dict["Name"])
////
////println(dict["Name"]!)
////
////
////dict["Hair Color"] = "Brown"
////
////println(dict)
////
////dict["Age"] = "old"     // can change types in a dictionary
////
////dict["Name"] = "Oscar"
////
////println(dict)
////
////var myName = dict["Name"]
////
////var myString = "My Name is: \(myName!)"
////
////
////var myNumberArr = [2,4,6,8]
////
////myNumberArr.append(10)
////
////myNumberArr.removeAtIndex(0)
////
////println(myNumberArr)
////
////
////var myDict = ["Name": "Oscar", "Age": "14"]
////var myNamed = myDict["Name"]
////var myAges = myDict["Age"]
////
////var myInfo = "My name is \(myNamed!) and I am \(myAges!) years old"
////
////
//
//
//// Lecture 25      ************************************
//
//
//var myName = "Oscar"
//
//var time = 9
//
//if myName == "Oscar" && time < 12 {
//    println("Hello Oscar. How is your morning?")
//}
//
//else if myName == "Oscar" && time > 12 {
//    println("Good afternoon Oscar")
//}
//else {
//    println("Who are you?")
//}
//
//if myName == "Steve" || time < 20 {
//    println("One statement is true")
//}
//
//var remainder = 11 % 3
//
//// even or odd number test
//
//var x = 5
//
//if x % 2 == 0 {
//    println("Even number")
//}
//else {
//    println("Odd number")
//}
//
//
//

// Lecture 29     *************************************
//
//
//for var i = 5; i <= 50; i = i + 5 {
//    println(i)
//}
//
//var arr = [1,2, 3,4]
//
//for x in arr {          // looping through an array called arr
//    println(x)
//}
//
//for (index, x) in enumerate(arr){
//    println(index)
//    arr[index] = x + 1
//}
//
//println(arr)
//
//var arr2 = [5.0, 6.0, 8.0, 11.0]
//
//for (index, y) in enumerate(arr2) {
//    println(y)
//    arr2[index] = y / 2
//}
//
//println(arr2)
//
//
// Lecture 31  *****************************************
//
//
//var i = 0
//
//while i < 20 {
//    
//    i = i + 2
//    println(i)
//}
//
//var arr = [6, 2, 9, 1, 5]
//
//var index = 0
//
//while index < arr.count {    // arr.count gets amount of items in array
//    println(arr[index])
//    index++
//}
//
//var arr2 = [7, 8, 9, 10, 11]
//
//var index2 = 0
//
//while index2 < arr2.count {
//    println(arr2[index2] - 1)
//    index2++
//}
//
//
// Lecture 33: Is it Prime? App Code   ****************************

var number = 5

var isPrime = true

if number == 1 {
    isPrime = false
}

if number != 2 && number != 1{

    for var i = 2; i < number; i++ {
        if number % i == 0 {
            isPrime = false
        }
    
    }
}

println(isPrime)



















