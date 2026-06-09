//
//  OrderItem.swift
//  CoffeeMasters
//
//  Created by Holding IT on 09/06/2026.
//

import SwiftUI

struct OrderItem: View {
    
    var item: (Product,Int)
    @EnvironmentObject var cartManager : CartManager
    
    var body: some View {
        HStack{
            Text("\(item.1)x")
            Text(item.0.name)
            Spacer()
            Text("\((Double(item.1) * item.0.price).formatted())x")
            Image(systemName: "trash")
                .font(.title).foregroundColor(Color("Secondary"))
                .padding()
                .onTapGesture {
                    cartManager.remove(product: item.0, )
                }
        }
    }
}

#Preview {
    OrderItem(item: (
        Product(id:1,name:"Dummy Coffee",description: "This is des",price: 2.58),
        1
    ))
}
