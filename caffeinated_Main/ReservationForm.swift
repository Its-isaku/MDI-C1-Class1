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
    let maxGuest = 10
    
    
    // State Variables
    //  its a Dynamic variable
    @State private var userName = ""
    @State private var guestCount = 1
    @State private var phoneNumber = ""
    @State private var previewText = ""
    @State private var alergies = ""
    @State private var childrenCount = 0
    @State private var occasion = ""
    
    var body: some View {
        Form{
            // Header
            Section{
                Text(restaurantName)
                    .font(.title3)
                    .bold()
                
                Text("Reservation Form")
                    .foregroundColor(.secondary)
            }
            
            Section(header: Text("Reservation Details")){
                TextField("Name", text: $userName)
                    .textInputAutocapitalization(.words)
                    .autocorrectionDisabled(true)
                    
                // Constant
                Stepper("Guests: \(guestCount)", value: $guestCount, in: 1 ... maxGuest)
            }
            
            Section(header:Text("Contact")){
                TextField("Phone", text:$phoneNumber)
                    .keyboardType(.numberPad)
                    
            }
            
            Section(header:Text("Occsion")){
                TextField("Dinner, Birthday, etc.",  text: $occasion)
            }
            
            Section(header:Text("Optional")){
                TextField("Alegries", text: $alergies)
                    .textInputAutocapitalization(.words)
                    .autocorrectionDisabled(true)
                
                Stepper("Children: \(childrenCount)", value: $childrenCount, in: 0 ... 10)
            }
            
            Section{
                Button("Preview reservation"){
                    previewText =
                    """
                    Name: \(userName.isEmpty ? "Not provided" : userName)
                    Guests: \(guestCount)
                    Phone: \(phoneNumber.isEmpty ? "Not provided" : phoneNumber)
                    Occasion: \(occasion.isEmpty ? "Not Provided" : occasion)
                    
                    Optional
                    Allergies: \(alergies.isEmpty ? "None" : alergies)
                    Children: \(childrenCount)
                    """
                }
                
            }
            
            Section(header: Text("Preview")){
                Text(previewText)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    ReservationForm()
}
