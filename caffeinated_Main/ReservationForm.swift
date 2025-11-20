//
//  ReservationForm.swift
//  Test_Store
//
//  Created by Isai Magdaleno Almeraz Landeros on 19/11/25.
//

import SwiftUI

struct ReservationForm: View {
    // Constants
    let restaurantName = "caffeinated"
    
    var body: some View {
        Form{
            // Header
            Section{
                Text(restaurantName)
                    .font(.title3)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    
            }
        }
    }
}

#Preview {
    ReservationForm()
}
