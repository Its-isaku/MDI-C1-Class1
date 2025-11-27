import UIKit

// -----------------Arrays-----------------
let dishes = ["pizza", "Pasta", "Gnocchi"] // creting the array
print(dishes[0])
print(dishes[1])

// mutable array
var orders = [String]()

// add to array
orders.append("soup")
orders.append("burger")
print(orders)

// --------------Dictionaries--------------
let menuPrices = [
    "Pizza": 12.99,
    "Salad": 13.80,
    "Pasta": 9.50,
]

print(menuPrices["Salad"]!)

// Challenge 1 - create a dictionary for drinks

let drinkPrices: [String: Double] = [
    "Late": 10.99,
    "Chai": 12.50,
    "Matcha": 10.20
]

print("Chai price:", drinkPrices["Chai"]!)

// foreach
let fruits = [
    "Apple": 1.50,
    "Banana": 0.58,
    "Mango": 2.30
]

fruits.forEach {fruit, price in
    if price > 1{
        print("\(fruit): $\(price)")
    }
}

// challenge 2 - print all the drinks using forEach
drinkPrices.forEach{drinks, price in
        print("\(drinks) - $\(price)")
}
