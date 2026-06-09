import SwiftUI

struct MenuPage: View {
    @EnvironmentObject var menuManager: MenuManager
    
    var body: some View {
        NavigationView {
            List {
                AppTitle().padding(.top,4)
                ForEach(menuManager.menu) { category in
                    Text(category.name)
                        .listRowBackground(Color("SurfaceBackground"))
                        .foregroundColor(Color("Secondary"))
                        .padding()
                    
                    ForEach(category.products, id: \.id) { product in
                        NavigationLink {
                            DetailsPage(product:product)
                        } label: {
                            ProductItem(product: product)
                                .padding(.top)
                                .padding(.leading)
                                .padding(.bottom, 12)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowSeparator(.hidden)
                .listRowBackground(Color("SurfaceBackground"))
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Products")
            .background(Color("SurfaceBackground"))
        }
    }
}

#Preview {
    MenuPage().environmentObject(MenuManager())
}
