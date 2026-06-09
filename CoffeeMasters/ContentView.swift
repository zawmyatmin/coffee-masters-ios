//
//  ContentView.swift
//  CoffeeMasters
//
//  Created by Zaw Myat Min on 31/05/2026.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var cartManager : CartManager
    
    var body: some View {
        TabView {
            MenuPage()
                .tabItem {
                    Image(systemName: "cup.and.saucer")
                    Text("Menu")
                }
            OffersPage()
                .tabItem {
                    Image(systemName: "tag")
                    Text("Offers")
                }
            OrdersPage()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Orders")
                }.badge(cartManager.products.count)
            InfoPage()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("Info")
                }
        }
    }
}

#Preview {
    ContentView()
}
