//
//  ContentView.swift
//  Test_Store
//
//  Created by Isai Magdaleno Almeraz Landeros on 17/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "iphone")
                .font(.system(size:50)) //size
                .foregroundColor(.green) //coor
            
            Text("Hello, world!")
                .font(.title2) //font style
                .padding() //space
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
