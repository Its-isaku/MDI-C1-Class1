import SwiftUI

struct AboutView: View {
    // Navigation
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        // Wrapping everything in a ScrollView to handle content overflow
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
                // --- MAIN TITLE ---
                Text("About Us")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                
                // FIRST SECTION: Logo and Text (The top card)
            
                VStack(alignment: .leading, spacing: 10) {
                    
                    // Container for the Logo and Titles
                    HStack(alignment: .top) {
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        
                        VStack(alignment: .leading) {
                            Text("Caffeinated")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text("Est. 2020")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding(.top, 5)
                        
                        Spacer() // Pushes the Logo and Text to the left
                    }
                    .padding(.top, 16)
                    .padding(.horizontal, 16)
                    
                    // Long descriptive Text
                    Text("Welcome to Caffeinated, where every cup tells a story. We source the finest beans from sustainable farms around the world, roasting them in-house to bring you the perfect brew every time.")
                        .foregroundColor(.gray)
                        .padding([.horizontal, .bottom], 16)
                }
                .background(Color("bg-gray"))
                .cornerRadius(16)
                .padding(.horizontal, 20)
                
                // --- IMAGE ---
                Image("HomeScreenImg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .frame(maxWidth: .infinity) // Center the image horizontally
                
                // --- MISSION TITLE ---
                Text("Our Mission")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 20)
                
                // SECOND SECTION: Mission (The bottom card)
            
                VStack(alignment: .leading) {
                    Text("To create a warm, welcoming space where community and coffee come together. We believe in quality over quantity, sustainability, and making every visit memorable.")
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading) // Ensures left alignment
                        .padding(16)
                }
                .background(Color("bg-gray"))
                .cornerRadius(16)
                .padding(.horizontal, 20)
                
                // --- BUTTON ---
                Button(action: {
                    navigationPath.removeLast(navigationPath.count)
                }) {
                    HStack {
                        Image(systemName: "house.fill")
                        Text("Return to Home")
                    }
                    .frame(maxWidth: 200, maxHeight: 10)
                    .padding()
                }
                .buttonStyle(.glass)
                .frame(maxWidth: .infinity) // Center the button horizontally
                .padding(.vertical, 8)
            }
        }
        .bg_Black() // Your custom background modifier
        /*.navigationBarHidden(true)*/ // Hides the default navigation bar
    }
}

#Preview {
    AboutView(navigationPath: .constant(NavigationPath()))
}
