//
//  ReservationForm.swift
//  Test_Store
//
//  Created by Isai Magdaleno Almeraz Landeros on 19/11/25.
//

import SwiftUI

struct ReservationForm: View {
    // Navigation
    @Binding var navigationPath: NavigationPath
    
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
    @State private var isOutdoorSeats = true
    @State private var UserWhantsOutdoorSeats = false
    @State private var showValidationError = false
    @State private var showConfirmation = false
    @State private var summaryAdultText = ""
    @State private var summaryChildrenText = ""
    
    // Functions
    func guestLabel(_ count: Int) -> String {
        count == 1 ? "Guest" : "Guests"
    }
    
    func estimateTotal (_ adultCount: Int, _ childrenCount: Int) -> Double {
        return (Double(adultCount) * 15.30) + (Double(childrenCount) * 8.20)
    }
    
    var body: some View {
        Form {
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
                
                // Name Validation
                if userName.isEmpty {
                    Text("Please enter a name.")
                        .font(.footnote)
                        .foregroundStyle(.red)
                        .transition(.opacity.combined(with: .slide))
                }
                    
                // Constant
                Stepper("Guests: \(guestCount)", value: $guestCount, in: 1 ... maxGuest)
                    if guestCount > 8 {
                        Text("Please note that for more than 8 guests you need to call ahead.")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            .transition(.opacity.combined(with: .slide))
                }
                
                Toggle("Outdoor Seating", isOn: $UserWhantsOutdoorSeats)
                    .disabled(!isOutdoorSeats)  // Desactiva el toggle si no hay outdoor disponible
                    .onChange(of: isOutdoorSeats) {
                        // Si outdoor se cierra, desactiva la selección del usuario
                        if !isOutdoorSeats {
                            UserWhantsOutdoorSeats = false
                        }
                    }
                
                if !isOutdoorSeats {
                    Text("Outdoor seating is currently unavailable")
                        .font(.footnote)
                        .foregroundStyle(.red)
                        .transition(.opacity.combined(with: .slide))
                }
            }
            
            Section(header:Text("Contact")){
                TextField("Phone", text:$phoneNumber)
                    .keyboardType(.numberPad)
                
                if phoneNumber.isEmpty {
                    Text("Please enter a phone number.")
                        .font(.footnote)
                        .foregroundStyle(.red)
                        .transition(.opacity.combined(with: .slide))
                } else if !phoneNumber.allSatisfy({ $0.isNumber }) {
                    Text("Please enter only numbers.")
                        .font(.footnote)
                        .foregroundStyle(.red)
                        .transition(.opacity.combined(with: .slide))
                }
                    
            }
            
            Section(header:Text("Occsion")){
                TextField("Dinner, Birthday, etc.",  text: $occasion)
            }
            
            Section(header:Text("Optional")){
                TextField("Alegries", text: $alergies)
                    .textInputAutocapitalization(.words)
                    .autocorrectionDisabled(true)
                
                Stepper("Children: \(childrenCount)", value: $childrenCount, in: 0 ... 10)
                
                if childrenCount > 0 {
                    Text("Kids will get a free dessert!")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .transition(.opacity.combined(with: .slide))
                }
                
            }
            
            Section{
                Button("Preview reservation"){
                    previewText =
                    """
                    Name: \(userName.isEmpty ? "Not provided" : userName)
                    \(guestLabel(guestCount)): \(guestCount)
                    Phone: \(phoneNumber.isEmpty ? "Not provided" : phoneNumber)
                    Occasion: \(occasion.isEmpty ? "Not Provided" : occasion)
                    
                    Optional
                    Allergies: \(alergies.isEmpty ? "None" : alergies)
                    Children: \(childrenCount)
                    
                    Total price estimate: $\(String(format: "%.2f", estimateTotal(guestCount, childrenCount)))
                    """
                }
                
                Text(previewText)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .transition(.opacity.combined(with: .slide))
                
            }
            
            Section {
                HStack {
                    Spacer()
                    Button("Confirm reservation") {
                        if userName.isEmpty || phoneNumber.isEmpty || !phoneNumber.allSatisfy({ $0.isNumber }) {
                            showValidationError = true
                            showConfirmation = false
                        } else {
                            showValidationError = false
                            showConfirmation = true
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    Spacer()
                }
                
                if showConfirmation {
                    Text("Reservation confirmed!")
                        .font(.footnote)
                        .foregroundColor(.green)
                        .transition(.opacity.combined(with: .slide))
                    
                    VStack() {
                        HStack() {
                            Text("Reservation Summary")
                                .font(.headline)
                            Spacer()
                            Image(systemName: "doc.text.magnifyingglass")
                        }
                        
                        // Display Adult Info
                        HStack {Text("Name:"); Spacer(); Text(userName)}
                        HStack {Text(guestLabel(guestCount)); Spacer(); Text("\(guestCount)")}
                        
                        // Display Children Info
                        HStack {Text("Children:"); Spacer(); Text("\(childrenCount)")}
                        
                        // Estimate
                        HStack {
                            Text("Estimation:")
                            Spacer()
                            Text("$\(estimateTotal(guestCount, childrenCount), specifier:"%.2f")")}
                        
                        // Button to return to home
                        Button(action: {
                            navigationPath.removeLast(navigationPath.count)
                        }) {
                            HStack {
                                Image(systemName: "house.fill")
                                Text("Return to Home")
                            }
                            .frame(maxWidth: 200, maxHeight: 10)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(50)
                        }
                        .padding(.top, 8)
                    }
                }
                
                if showValidationError {
                    Text("Please fill all required fields correctly.")
                        .font(.footnote)
                        .foregroundStyle(.red)
                        .transition(.opacity.combined(with: .slide))
                }
            }
            
            
        }
//        .navigationBarBackButtonHidden(true)
        .animation(.easeInOut(duration: 0.3), value: userName.isEmpty)
        .animation(.easeInOut(duration: 0.3), value: guestCount > 8)
        .animation(.easeInOut(duration: 0.3), value: isOutdoorSeats)
        .animation(.easeInOut(duration: 0.3), value: phoneNumber.isEmpty)
        .animation(.easeInOut(duration: 0.3), value: phoneNumber.allSatisfy { $0.isNumber })
        .animation(.easeInOut(duration: 0.3), value: childrenCount > 0)
        .animation(.easeInOut(duration: 0.3), value: previewText.isEmpty)
        .animation(.easeInOut(duration: 0.3), value: showValidationError)
        .animation(.easeInOut(duration: 0.3), value: showConfirmation)
    }
}

#Preview {
    ReservationForm(navigationPath: .constant(NavigationPath()))
}
