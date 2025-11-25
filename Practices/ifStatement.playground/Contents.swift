import UIKit

// if - else if - else

/*
 <|-------------- Syntax --------------|>
 
 if condition1 {
    this block runs if condition is true
 } else if condition2 {
    this block runs if condition1 is false and condotion2 is true
 } else {
    this block runs if none of the above conditions are true
 }

*/

// <|-------------- Example 1 --------------|>
var guests = 7
let capacity = 10

if guests > capacity {
    print("Over capacity!")
} else {
    print("We can seat this party")
}

// <|-------------- Example 2 --------------|>
let rating = 4.2

if rating >= 4.5 {
    print("Excelent!")
} else if rating >= 3.5 {
    print("Good")
} else {
    print("Needs Improvement")
}

// <|-------------- Example 3 --------------|>
let isOpen = true
let hasOutdorSeating = true

if isOpen && hasOutdorSeating {
    print("Open with outdoor seating")
} else if isOpen && !hasOutdorSeating {
    print("Open indoor only")
} else {
    print("Closed")
}

// <|-------------- Example 4 --------------|>
let  userName = "Ken"

if userName == "Ken" {
    print("hello Ken")
} else {
    print("Unkouwn user")
}

// <|-------------- Example 5 Ternary --------------|>
let price = 12.0

let label = price > 10 ? "Premium" : "Regular"
print(label)

// <|-------------- Example 6 --------------|>
let children = 2
let groupSize = 5

if groupSize >= 8 {
    print("Large group - call manager")
} else if children > 0 {
    print("Offer Kids Menu")
} else {
    print("Standard seating")
}

// <|-------------- Minichallenge --------------|>
var isVIP = false

if isVIP == true {
    print("User is Vip")
} else {
    print("User is Not Vip")
}
