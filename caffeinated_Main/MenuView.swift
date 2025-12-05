import SwiftUI

// Modificador necesario para que la sección Summary sea legible y funcione
extension View {
    func cardIconStyle() -> some View {
        self
            .frame(width: 40, height: 40)
            .background(Color.white.opacity(0.5))
            .cornerRadius(25)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.white)
    }
}

struct MenuView: View {
    // --------- Properties ---------
    
    let menuItems = [
        "Espresso": 2.99,
        "Cappuccino": 4.49,
        "Latte": 4.99,
        "Americano": 3.49,
        "Mocha": 5.49,
        "Iced Coffee": 3.99,
        "Green Tea": 3.49,
        "Hot Chocolate": 4.49
    ]
    
    // --------- State Variables ---------
    
    @State private var showMessage = false
    @State private var showAffordable = false
    @State private var showDesserts = false
    @State private var showPremium = false
    @Binding var navigationPath: NavigationPath
    
    // --------- Helper Functions ---------
    
    func getHighestPrice() -> String {
        var maxValue = 0.0
        for item in displayMenu {
            if item.price > maxValue {
                maxValue = item.price
            }
        }
        return String(format: "$%.2f", maxValue)
    }
    
    func getLowestPrice() -> String {
        var minValue = displayMenu.first?.price ?? 0.0
        for item in displayMenu {
            if item.price < minValue {
                minValue = item.price
            }
        }
        return String(format: "$%.2f", minValue)
    }
    
    func getTotalItems() -> Int {
        displayMenu.count
    }
    
    // --------- Computed Properties ---------
    
    var SortedMenu: [(name:String, price:Double)] {
        menuItems
            .sorted {$0.value > $1.value }
            .map {(name: $0.key, price: $0.value)}
    }
    
    var displayMenu: [(name:String, price:Double)] {
        if showAffordable == true {
            return SortedMenu.filter {$0.price < 4.0}
        } else if showPremium == true {
            return SortedMenu.filter {$0.price > 4.20}
        } else {
            return SortedMenu
        }
    }
    
    var avaragePrice : Double {
        let prices = menuItems.values
        let total = prices.reduce(0, +)
        return total / Double(prices.count)
    }
    
    var premiumCount: Int {
        displayMenu.filter { $0.price > 4.20 }.count
    }
    
    var totalPrice: Double {
        var total = 0.0
        for item in displayMenu {
            total += item.price
        }
        return total
    }
    
    // --------- Body ---------
    
    var body: some View {
        ZStack {
            VStack{
                // Header con logo y título
                HStack{
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height:60)
                    
                    Text("Today's menu")
                        .font(.title2)
                        .bold()
                }
                .foregroundColor(.white)
                
                // Opciones dropdown menu con efecto de cristal
                HStack {
                    Spacer()
                    
                    Menu("Options") {
                        Toggle("Show welcome Message", isOn: $showMessage)
                        Toggle("Show only affordable items < than $4.0", isOn: $showAffordable)
                        Toggle("Show only Premium Items", isOn: $showPremium)
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(16)
                    
                    Button("Show Desserts") {
                        showDesserts = true
                        print(showDesserts)
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(16)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .sheet(isPresented: $showDesserts) {
                    DessertView()
                }
                
                if showMessage {
                    Text("Welcome to Caffeinated!")
                        .font(.headline)
                        .foregroundColor(.brown)
                }
                
                // List Display
                List {
                    ForEach(displayMenu, id: \.name) { item in
                        MenuItemRowView(name: item.name, price: item.price)
                            .listRowBackground(Color("bg-gray"))
                    }
                    
                    //Summary Section
                    Section {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Summary")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            HStack(spacing: 10){
                                VStack{
                                    Image(systemName: "chart.line.uptrend.xyaxis")
                                        .cardIconStyle()
                                    Text("Lowest").font(.subheadline)
                                    Text("\(getLowestPrice())")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity)
                                
                                VStack{
                                    Image(systemName: "chart.line.downtrend.xyaxis")
                                        .cardIconStyle()
                                    Text("Highest").font(.subheadline)
                                    Text("\(getHighestPrice())")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity)
                                
                                VStack{
                                    Image(systemName: "cup.and.heat.waves.fill")
                                        .cardIconStyle()
                                    Text("Items").font(.subheadline)
                                    Text("\(getTotalItems())")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity)
                                
                                VStack{
                                    Image(systemName: "star.fill")
                                        .cardIconStyle()
                                    Text("Premium").font(.subheadline)
                                    Text("\(premiumCount)")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity)
                            }
                            .foregroundColor(.gray)
                        }
                        .padding(20)
                        .background(Color("bg-gray"))
                        .cornerRadius(16)
                        
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color("bg-Black"))
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color("bg-Black"))
                
            }
        }
        .bg_Black()
    }
}

#Preview {
    MenuView(navigationPath: .constant(NavigationPath()))
}
