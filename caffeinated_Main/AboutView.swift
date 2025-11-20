//
//  AboutView.swift
//  Test_Store
//
//  Created by Isai Magdaleno Almeraz Landeros on 17/11/25.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("About Caffinated")
                .font(Font.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.brown)
                .padding(.bottom, 20)
            
            Text("Caffinated is a platform to find, purchase coffee products and see nearby coffee shops.")
                .padding(.horizontal,20)
                .padding(.bottom, 20)
            
            HStack{
                Image(systemName: "cup.and.saucer")
                    .font(.system(size: 40))
                    
                Image(systemName: "storefront")
                    .font(.system(size: 40))
                
                Image(systemName: "cup.and.saucer")
                    .font(.system(size: 40))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .multilineTextAlignment(.center)
    }
}

#Preview {
    AboutView()
}
