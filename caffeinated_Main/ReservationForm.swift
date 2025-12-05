import SwiftUI

// Estension to make placeholder text be visible
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}


struct ReservationForm: View {
    // Navigation
    @Binding var navigationPath: NavigationPath
    
    // Constants
    let restaurantName = "caffeinated"
    let maxGuest = 10
    
    
    // State Variables
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
    @State private var hasInteractedWithName = false
    @State private var hasInteractedWithPhone = false
    
    // Functions
    func guestLabel(_ count: Int) -> String {
        count == 1 ? "Guest" : "Guests"
    }
    
    func estimateTotal (_ adultCount: Int, _ childrenCount: Int) -> Double {
        return (Double(adultCount) * 15.30) + (Double(childrenCount) * 8.20)
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            // Header
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(restaurantName)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    
                    Text("Reserve")
                        .foregroundColor(.white)
                }
                .padding(.leading, 20)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(Color("bg-Black"))
            
            Form {
                
                Section(header: Text("Contact").foregroundColor(.white)){
                    // Campo de Nombre
                    TextField("", text: $userName)
                        .textInputAutocapitalization(.words)
                        .autocorrectionDisabled(true)
                        .foregroundColor(.white)
                        .onChange(of: userName) {
                            hasInteractedWithName = true
                        }
                        .placeholder(when: userName.isEmpty) {
                            Text("Enter your name")
                                .foregroundColor(Color.white.opacity(0.6))
                        }
                    
                    if userName.isEmpty && hasInteractedWithName {
                        Text("Please enter a name.")
                            .font(.footnote)
                            .foregroundStyle(.red)
                            .transition(.opacity.combined(with: .slide))
                    }
                    
                    // Campo de Teléfono
                    TextField("", text:$phoneNumber)
                        .keyboardType(.numberPad)
                        .foregroundColor(.white)
                        .onChange(of: phoneNumber) {
                            hasInteractedWithPhone = true
                        }
                        .placeholder(when: phoneNumber.isEmpty) {
                            Text("Phone")
                                .foregroundColor(Color.white.opacity(0.6))
                        }
                    
                    if phoneNumber.isEmpty && hasInteractedWithPhone {
                        Text("Please enter a phone number.")
                            .font(.footnote)
                            .foregroundStyle(.red)
                            .transition(.opacity.combined(with: .slide))
                        
                    } else if !phoneNumber.isEmpty && !phoneNumber.allSatisfy({ $0.isNumber }) && hasInteractedWithPhone {
                        Text("Please enter only numbers.")
                            .font(.footnote)
                            .foregroundStyle(.red)
                            .transition(.opacity.combined(with: .slide))
                    }
                }
                .listRowBackground(Color("bg-gray"))
                .foregroundColor(.white)
                
                Section(header: Text("Reservation Details").foregroundColor(.white)){
                    Stepper("Guests: \(guestCount)", value: $guestCount, in: 1 ... maxGuest)
                        if guestCount > 8 {
                            Text("Please note that for more than 8 guests you need to call ahead.")
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                                .transition(.opacity.combined(with: .slide))
                    }
                    
                    Toggle("Outdoor Seating", isOn: $UserWhantsOutdoorSeats)
                        .tint(.white)
                        .disabled(!isOutdoorSeats)
                        .onChange(of: isOutdoorSeats) {
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
                .listRowBackground(Color("bg-gray"))
                .foregroundColor(.white)
                
                Section(header:Text("Optional").foregroundColor(.white)){
                    TextField("", text: $alergies)
                        .textInputAutocapitalization(.words)
                        .autocorrectionDisabled(true)
                        .foregroundColor(.white)
                        .placeholder(when: alergies.isEmpty) {
                            Text("Alegries")
                                .foregroundColor(Color.white.opacity(0.6))
                        }
                    
                    TextField("",  text: $occasion)
                        .foregroundColor(.white)
                        .placeholder(when: occasion.isEmpty) {
                            Text("Occasion (Dinner, Birthday, etc.)")
                                .foregroundColor(Color.white.opacity(0.6))
                        }
                    
                    Stepper("Children: \(childrenCount)", value: $childrenCount, in: 0 ... 10)
                    
                    if childrenCount > 0 {
                        Text("Kids will get a free dessert!")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            .transition(.opacity.combined(with: .slide))
                    }
                    
                }
                .listRowBackground(Color("bg-gray"))
                .foregroundColor(.white)
                
                Section {
                    HStack {
                        Spacer()
                        
                        Button("Confirm reservation") {
                            hasInteractedWithName = true
                            hasInteractedWithPhone = true
                            
                            if userName.isEmpty || phoneNumber.isEmpty || !phoneNumber.allSatisfy({ $0.isNumber }) {
                                showValidationError = true
                                showConfirmation = false
                            } else {
                                showValidationError = false
                                showConfirmation = true
                            }
                        }
                        .frame(maxWidth: 200, maxHeight: 10) .padding(10)
                        .buttonStyle(.glass)
                        .foregroundColor(.white)
                        Spacer()
                    }
                    
                    if showConfirmation {
                        VStack() {
                            Text("Reservation confirmed!")
                                .font(.footnote)
                                .foregroundColor(.green)
                                .transition(.opacity.combined(with: .slide))

                            HStack() { Text("Reservation Summary").font(.headline); Spacer(); Image(systemName: "doc.text.magnifyingglass") }
                            HStack {Text("Name:"); Spacer(); Text(userName)}
                            HStack {Text(guestLabel(guestCount)); Spacer(); Text("\(guestCount)")}
                            HStack {Text("Children:"); Spacer(); Text("\(childrenCount)")}
                            HStack { Text("Estimation:"); Spacer(); Text("$\(estimateTotal(guestCount, childrenCount), specifier:"%.2f")")}
                            
                            Button(action: { navigationPath.removeLast(navigationPath.count) }) {
                                HStack { Image(systemName: "house.fill"); Text("Return to Home") }
                                .frame(maxWidth: 200, maxHeight: 10) .padding() .foregroundColor(.white) .cornerRadius(50)
                            }
                            .buttonStyle(.glass)
                            .padding(.top, 8)
                        }
                        .foregroundColor(.white)
                    }
                    
                    if showValidationError { Text("Please fill all required fields correctly.").font(.footnote).foregroundStyle(.red).transition(.opacity.combined(with: .slide)) }
                }
                .listRowBackground(Color("bg-gray"))
                .foregroundColor(.white)
                
            }
            .scrollContentBackground(.hidden)
            .background(Color("bg-Black"))
            
        }
        .bg_Black()
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
