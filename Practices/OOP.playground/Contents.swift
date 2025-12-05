import UIKit

/*
 A class is used to define a Custom type that groupes together dat(properties) and behavior(methods)
 It acts as a blueprint for creating objects, allowing us to model real-world entities like customers, books, gods, etc.
 
 -----Syntax-----
 Class ClassName { <- PascalCase
     var propertyName1: DataType
     var propertyName2: DataType
 
    init( propertyName1: DataTypa,  propertyName2: DataType) {
         self.propertyName1 =  propertyName1
         self.propertyName2 =  propertyName2
    }
 
    func funcitonName() -> ReturnType {
        return
    }
 }
 
 */

// Example 1
class Dog {
    var name: String
    var age: Int
    var breed: String
    
    init(_ name: String, _ age: Int, _ breed: String) {
        self.name = name
        self.age = age
        self.breed = breed
    }
    
    func bark() {
        print("\(name): Bark Bark!")
    }
}


let dog1 = Dog("Chick", 2, "Chihuiahua")
let dog2 = Dog("Nacho", 3, "Chihuiahua")

dog1.bark()
dog2.bark()
print("----------------\n")

// Example 2
class Customer {
    var name: String
    var email: String
    var visits: Int
    var phone: String
    
    init(_ name: String, _ email: String, _ visits: Int, _ phone: String) {
        self.name = name
        self.email = email
        self.visits = visits
        self.phone = phone
    }
    
    func greeting() -> String {
        return "Welcome back \(name)"
    }
    
    func addVisits() {
        visits += 1
    }
    
    func summary() -> String {
        "\(name) - Visists: \(visits)"
    }
    
    func contactCard() -> String {
        """
        Name: \(name)
        Email: \(email)
        Phone: \(phone)
        Visists: \(visits)
        """
    }
}

let Customer1 = Customer("Isai", "IsaiAlmeraz@email.com", 12, "(+52) 665-127-2501")
let Customer2 = Customer("Sofia", "SofiaAlmaraz@email.com", 10, "(+52) 664- 12-48973")
let Customer3 = Customer("Edi", "EdiMontez@email.com", 13, "(+52) 664-167-4572")

print(Customer1.greeting())
Customer1.addVisits()
print("Number of visists: \(Customer1.visits)")
print(Customer1.email)
print(Customer1.summary())
print(Customer1.contactCard())
print("----------------\n")

print(Customer2.greeting())
Customer2.addVisits()
print("Number of visists: \(Customer2.visits)")
print(Customer2.email)
print(Customer2.summary())
print(Customer2.contactCard())
print("----------------\n")

print(Customer3.greeting())
Customer3.addVisits()
print("Number of visists: \(Customer3.visits)")
print(Customer3.email)
print(Customer3.summary())
print(Customer3.contactCard())
print("----------------\n")

