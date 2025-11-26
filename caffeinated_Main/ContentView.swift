//
//  ContentView.swift
//  Test_Store
//
//  Created by Isai Magdaleno Almeraz Landeros on 17/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                Text("Welcome to Caffeinated!")
                    .font(.title) //font style
                    .padding() //space
                
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
            }
            .padding()
            .navigationDestination(for: String.self) { destination in
                if destination == "reservation" {
                    ReservationForm(navigationPath: $navigationPath)
                } else if destination == "about" {
                    AboutView(navigationPath: $navigationPath)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
