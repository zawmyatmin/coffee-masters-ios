import SwiftUI

struct Offer: View {
    var title="";
    var description="";
    var body: some View {
        ZStack{
            Image("BackgroundPattern").frame(maxWidth:.infinity,maxHeight: 200,).clipped()
            VStack {
                Text(title).padding().font(.title).background(Color("CardBackground"));
                Text(description).padding().background((Color("CardBackground")))
            }
        }
    }
}

#Preview {
    OffersPage()
}
