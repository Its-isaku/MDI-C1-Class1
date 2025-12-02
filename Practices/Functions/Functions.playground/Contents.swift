import UIKit

/*
 Functions
 
 func functionName(parameter1: Typem parameter2: Type) -> ReturnType {
    Functionbody
    logic goes here
    
    retun value
 }
 
 */

// Example 1
func printWelcome() {
    print("Hello cohort#5")
}

// Example 2
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

let message = greet(person: "Taylor")
print(message)

// Example 3
func add(number1:Int, number2:Int) -> Int {
    return number1 + number2
}
print(add(number1: 222,number2: 333))

// Example 4
func multiply(_ x:Int, _ y:Int) -> Int {
    return x * y
}
print(multiply(5, 100))

// Example 5
func deliveryTime(_ minutes: Int) -> String {
    return "Ready in \(minutes) minutes"
}
let message2 = deliveryTime(10)
print(message2)

/* MiniChallenge
 1.  Define a function called welcomeStudent.
 2.  The function should take one parameter: name of type String.
 3.  The function should return a String.
 4.  Inside the function, build a message like: "Welcome, [name]! Ready to learn Swift?".
 5.  Call the function with a sample name and print the result.
*/

func welcomeStudent (_ StudentName: String) -> String {
    return "Welcome \(StudentName)!, Ready to learn Swift?"
}
print(welcomeStudent("Isai"))


//<|--------------- Functions 102-Class 3 ---------------|>

func greetCustomer(_ name:String) {
    print("Welcome, \(name)!")
}
greetCustomer("Isai")

func printMenuItem(_ name: String, _ price: Double) {
    print("The dish \(name): $\(price)")
}
printMenuItem("Pizza", 9.99)

func totalWithTax(_ price: Double) -> Double {
    return price * 1.08
}
let amount = totalWithTax(100)
print(amount)

let menu = [
    "Pizza": 9.90,
    "Soup": 4.50,
    "Steak": 14.99
]

for (name, price) in menu {
    printMenuItem(name,price)
}

func renderRow(_ name: String, _ price: Double) {
    print ("Row -> \(name), $\(price)")
}

renderRow("Tacos", 7.50)
