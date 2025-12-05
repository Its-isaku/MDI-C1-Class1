import SwiftUI

struct DessertView: View {
    // variables
    let DessertItems = [
        "Chocolate Brownie": 4.99,
        "Tiramisu": 6.49,
        "Cheesecake": 5.99,
        "Carrot Cake": 5.49,
        "Croissant": 3.99,
        "Cinnamon Roll": 4.49,
        "Blueberry Muffin": 3.49,
        "Apple Pie": 4.99,
        "Macarons": 6.99,
        "Chocolate Chip Cookie": 2.99
    ]
    
    
    var SortedMenu: [(name:String, price:Double)] {
        DessertItems
            .sorted {$0.value > $1.value } // array of key,value
            .map {(name: $0.key, price: $0.value)} // rename key:value to name:price
    }
    
    var body: some View {
        ZStack {
            Color("bg-Black")
            
            List {
                ForEach(SortedMenu, id: \.name) { Item in
                    HStack {
                        Text(Item.name)
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                        Text(String(format: "$%.2f", Item.price))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .padding(.vertical,10)
                    .listRowBackground(Color("bg-gray"))
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color("bg-Black"))
        }
        .ignoresSafeArea()
    }
}

#Preview {
    DessertView()
}
