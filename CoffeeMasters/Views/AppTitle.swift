import SwiftUI

struct AppTitle: View {
    var body: some View {
        HStack {
            Spacer()
            Image("logo")
            Spacer()
        }
            .padding(4)
            .listRowBackground(Color("Secondary"))
            .background(Color("Secondary"))
    }
}
