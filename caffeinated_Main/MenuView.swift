//
//  MenuView.swift
//  Test_Store
//
//  Created by Isai Magdaleno Almeraz Landeros on 26/11/25.
//

import SwiftUI

struct MenuView: View {
    // variables
    let menuItems = [
        "Espresso": 2.99,
        "Cappuccino": 4.49,
        "Latte": 4.99,
        "Americano": 3.49,
        "Mocha": 5.49,
        "Iced Coffee": 3.99,
        "Green Tea": 3.49,
        "Hot Chocolate": 4.49
    ]
    
    @State private var showMessage = false
    @State private var showAffordable = false
    @State private var showDesserts = false
    @State private var showPremium = false
    
    // functions
    func getHighestPrice() -> String {
        var maxValue = 0.0
        for item in displayMenu {
            if item.price > maxValue {
                maxValue = item.price
            }
        }
        return String(format: "$%.2f", maxValue)
    }
    
    func getLowestPrice() -> String {
        var minValue = displayMenu.first?.price ?? 0.0
        for item in displayMenu {
            if item.price < minValue {
                minValue = item.price
            }
        }
        return String(format: "$%.2f", minValue)
    }
    
    func getTotalItems() -> Int {
        displayMenu.count
    }
    
    // computed properties
    // ----Sytax----
    /*
     var propertyName: type {
        return calculated value
     }
     */
    var SortedMenu: [(name:String, price:Double)] {
        menuItems
            .sorted {$0.value > $1.value } // array of key,value
            .map {(name: $0.key, price: $0.value)} // rename key:value to name:price
    }
    
    var displayMenu: [(name:String, price:Double)] {
        if showAffordable == true {
            return SortedMenu.filter {$0.price < 4.0}
        } else if showPremium == true {
            return SortedMenu.filter {$0.price > 4.20}
        } else {
            return SortedMenu
        }
    }
    
    var avaragePrice : Double {
        let prices = menuItems.values
        let total = prices.reduce(0, +)
        return total / Double(prices.count)
    }
    
    var premiumCount: Int {
        displayMenu.filter { $0.price > 4.20 }.count
    }
    
    var totalPrice: Double {
        var total = 0.0
        for item in displayMenu {
                total += item.price
            }
        return total
    }
    
    // Main
    var body: some View {
        VStack{
            VStack{
                Image("H-FullLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(height:60)
                
                Text("Today's menu")
                    .font(.title2)
                    .bold()
            }
            
            
            
            // Toggles
            VStack(){
                Toggle("Show welcome Message", isOn: $showMessage)
                Toggle("Show only affordable items < than $4.0", isOn: $showAffordable)
                Toggle("Show only Premium Items", isOn: $showPremium)
                Button("show Desserts") {
                    showDesserts = true
                    print(showDesserts)
                }
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .background(.brown.opacity(0.5))
                .cornerRadius(10)
                .sheet(isPresented: $showDesserts) {
                    DessertView()
                }
            }
            .padding()
            
            if showMessage {
                Text("Welcome to Caffeinated!")
                    .font(.headline)
                    .foregroundColor(.brown)
            }
        
            List {
                ForEach(displayMenu, id: \.name) { item in
                    MenuItemRowView(name: item.name, price: item.price)
                }
            }
            
            
            
            Section{
                VStack{
                    Text("Total Items: \(getTotalItems())")
                    Text("Total: \(totalPrice,specifier: "%.2f")")
                    
                    HStack{
                        Text("High: \(getHighestPrice())")
                        Text("Low: \(getLowestPrice())")
                        Text("av: \(avaragePrice,specifier: "%.2f")")
                        Text("Premium: \(premiumCount)")
                    }
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
