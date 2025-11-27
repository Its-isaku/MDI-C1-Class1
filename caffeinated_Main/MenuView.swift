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
    
    
    // functions
    func getHighestPrice() -> String {
        let maxValue = menuItems.max(by: { $0.value < $1.value })!.value
        return String(format: "$%.2f", maxValue)
    }
    
    func getLowestPrice() -> String {
        let maxValue = menuItems.min(by: { $0.value < $1.value })!.value
        return String(format: "$%.2f", maxValue)
    }
    
    var body: some View {
        VStack{
            VStack{
                Image("littleLemonLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(height:50)
                
                Text("Today's menu")
                    .font(.title2)
                    .bold()
            }
        
            List {
                ForEach(menuItems.sorted(by: { $0.value > $1.value }), id: \.key) { item, price in
                    HStack {
                        Text(item)
                            .font(.headline)
                        Spacer()
                        Text(String(format: "$%.2f", price))
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical,10)
                }
            }
            
            Section{
                VStack{
                    Text("Total Items: \(menuItems.count)")
                    Text("Highest price: \(getHighestPrice())")
                    Text("Lowest price: \(getLowestPrice())")
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
