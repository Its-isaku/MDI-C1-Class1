//
//  PremiumBadgeView.swift
//  Test_Store
//
//  Created by Isai Magdaleno Almeraz Landeros on 01/12/25.
//

import SwiftUI
// --------Variables & States------


// ------------Functions-----------


// --------------Main--------------
struct PremiumBadgeView: View {
    var body: some View {
        HStack{
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            
            Text("Premium")
                .font(.caption.bold())
        }
        .padding(6)
        .background(Color.orange.opacity(0.2))
        .cornerRadius(6)
    }
}

#Preview {
    PremiumBadgeView()
}
