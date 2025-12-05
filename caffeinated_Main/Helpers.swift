import SwiftUI

extension View {
    func bg_Black() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("bg-Black").ignoresSafeArea())
    }
}
