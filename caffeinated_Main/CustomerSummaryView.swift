import SwiftUI

struct CustomerSummaryView: View {
    // --------Variables, States & Classes------
    var customers: [Customer] = [
        Customer("Isai", "IsaiAlmeraz@email.com", 12, true),
        Customer("Sofia", "SofiaAlmaraz@email.com", 10, false),
        Customer("Edi", "EdiMontez@email.com", 13, true)
    ]
    
    @Binding var navigationPath: NavigationPath
    @State var showLoyaltyMembers: Bool = false
    
    // ------------Functions & Computed Functions-----------
    var DisplayCustomers: [Customer] {
        
        if showLoyaltyMembers == true {
            return customers.filter { $0.isLoyaltyMember }
        } else {
            return customers.sorted { $0.isLoyaltyMember && !$1.isLoyaltyMember }
        }
    }
    
    
    var body: some View {
        ZStack {
            Color("bg-Black")
                .ignoresSafeArea()
            

            VStack {
                Toggle("Show Loyalty Members", isOn: $showLoyaltyMembers)
                    .padding()
                    .background(Color("bg-Black"))
                    .foregroundColor(.white)
                
                List(DisplayCustomers) { c in
                    HStack {
                        if c.isLoyaltyMember {
                            Image(systemName: "star.fill")
                                .foregroundColor(.white)
                        }
                        
                        if c.isLoyaltyMember == false {
                            Text(c.summary())
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.leading, 30)
                        } else {
                            Text(c.summary())
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                    }
                    .listRowBackground(Color("bg-gray"))
                }
                .scrollContentBackground(.hidden)
                .background(Color("bg-Black"))
            }
        }
    }
}

#Preview {
    CustomerSummaryView(navigationPath: .constant(NavigationPath()))
}
