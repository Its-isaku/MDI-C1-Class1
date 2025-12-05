// ----------------Imports-------------
import SwiftUI

// ----------------View---------------
struct HomeMenuView: View {

    // --------Variables & States------
    @State private var navigationPath = NavigationPath()
    
    // ------------Functions-----------
    
    
    // --------------Main--------------
    var body: some View {
        NavigationStack(path: $navigationPath) {
            //Background Stack
            ZStack {
                VStack {
                    
                    //Logo
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .padding(.bottom, 30)
                    
                    
                    Text("WELCOME TO")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                    
                    Text("Caffeinated")
                        .font(.title .pointSize(40)) //font style
                        .padding(.vertical, 5) //space
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    Text("Artisan coffee crafted with care")
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                    
                    
                    // Button to AboutView with Liquid Glass
                    Button(action: {
                        navigationPath.append("about")
                    }) {
                        HStack {
                            Image(systemName: "i.circle")
                            Text("About caffeinated")
                        }
                        .frame(maxWidth: 200, maxHeight: 10)
                        .padding()
                    }
                    .buttonStyle(.glass)
                    .padding(.top, 8)
                    
                    // Button to ReservationForm with Liquid Glass
                    Button(action: {
                        navigationPath.append("reservation")
                    }) {
                        HStack {
                            Image(systemName: "frying.pan")
                            Text("Make a reservation")
                        }
                        .frame(maxWidth: 200, maxHeight: 10)
                        .padding()
                    }
                    .buttonStyle(.glass)
                    .padding(.top, 8)
                    
                    // Button to Menu View with Liquid Glass
                    Button(action: {
                        navigationPath.append("menu")
                    }) {
                        HStack {
                            Image(systemName: "menucard")
                            Text("See Menu")
                        }
                        .frame(maxWidth: 200, maxHeight: 10)
                        .padding()
                    }
                    .buttonStyle(.glass)
                    .padding(.top, 8)
                    
                    // Button to Menu View with Liquid Glass
                    Button(action: {
                        navigationPath.append("customer")
                    }) {
                        HStack {
                            Image(systemName: "person")
                            Text("See Customets")
                        }
                        .frame(maxWidth: 200, maxHeight: 10)
                        .padding()
                    }
                    .buttonStyle(.glass)
                    .padding(.top, 8)
                }
                .navigationDestination(for: String.self) { destination in
                    if destination == "reservation" {
                        ReservationForm(navigationPath: $navigationPath)
                    } else if destination == "about" {
                        AboutView(navigationPath: $navigationPath)
                    } else if destination == "menu" {
                        MenuView(navigationPath: $navigationPath)
                    } else if destination == "customer" {
                        CustomerSummaryView(navigationPath: $navigationPath)
                    }
                }
            }
                // Black Background
                .bg_Black()
        }
    }
}

#Preview {
    HomeMenuView()
}
