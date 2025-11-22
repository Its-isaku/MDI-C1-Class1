import UIKit

var restaurantName = "Cafe Delight"
restaurantName = "Bistro Bliss"
print(restaurantName)

let city = "San Francisco"
// city = "Los Angeles" // this line would cause a compile-time error
print(city)

// types of data
// String -> text
var specialDish = "Pasta"

// Int -> whole number
var availableTables = 5

// Double -> decimal number
var dishPrice = 12.99

// Bool -> true or false
var isOpen = true

// interpolation
print("Today's special dish: (specialDish) - $(dishPrice).")

// mini challenge 1:
var numberOfTables = 10
let ownerName = "Mario"
print("Little Lemon has (numberOfTables) tables, owned by (ownerName).")

// mini challenge 2:  add a 15% tip to a restaurant bill
let pastaPrice = 10.50
let saladPrice = 6.25
let total = pastaPrice + saladPrice
print("The total price is: $\(total*1.15)")
