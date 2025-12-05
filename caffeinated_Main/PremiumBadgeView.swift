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
                .foregroundColor(.white)
        }
        .padding(6)
//        .background(Color.white.opacity(0.5))
        .cornerRadius(6)
    }
}

#Preview {
    PremiumBadgeView()
}
