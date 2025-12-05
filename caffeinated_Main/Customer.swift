// ---------Imports---------
import Foundation

// ----------Class----------
class Customer: Identifiable {
    let id = UUID()
    var name: String
    var email: String
    var visits: Int
    var isLoyaltyMember: Bool
    
    init(_ name: String, _ email: String, _ visits: Int, _ isLoyaltyMember: Bool) {
        self.name = name
        self.email = email
        self.visits = visits
        self.isLoyaltyMember = isLoyaltyMember
    }
    
    func summary() -> String {
        "\(name) - Visists: \(visits)"
    }
    
    func contactCard() -> String {
        """
        Name: \(name)
        Email: \(email)
        """
    }
}
