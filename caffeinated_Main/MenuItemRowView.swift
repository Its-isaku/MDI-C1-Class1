//
//  MenuItemRowView.swift
//  Test_Store
//
//  Created by Isai Magdaleno Almeraz Landeros on 01/12/25.
//

import SwiftUI

struct MenuItemRowView: View {
    // --------Variables & States------
    let name: String
    let price: Double
    
    // ------------Functions-----------
    
    
    // --------------Main--------------
    var body: some View {
        HStack {
            Text (name)
                .font(.headline)
                .foregroundColor(.white)
            
            Spacer()
            
            if price > 4.20 {
                PremiumBadgeView()
            }
            
            Text("$\(price, specifier: "%.2f")")
                .foregroundColor(.white)
                .fontWeight(.bold)
            
            
        }
        .padding(.horizontal, 16)
    }
}

//#Preview {
//    MenuItemRowView()
//}
