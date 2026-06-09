//
//  CoffeeMastersApp.swift
//  CoffeeMasters
//
//  Created by Zaw Myat Min on 31/05/2026.
//

import SwiftUI

@main
struct CoffeeMastersApp: App {
    
    var menuManager : MenuManager = MenuManager()
    var cartManager : CartManager = CartManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(menuManager)
                .environmentObject(cartManager)
        }
    }
}
