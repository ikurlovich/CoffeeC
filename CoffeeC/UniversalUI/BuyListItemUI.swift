//
//  BuyListItem.swift
//  CoffeeC
//
//  Created by Илья Курлович on 13.02.2024.
//

import SwiftUI

struct BuyListItemUI: View {
    var name: String
    var price: String
    var numberOfCups: Int
    var addCoffeeAction: () -> Void
    var removeCoffeeAction: () -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 90)
                .foregroundStyle(.coffeeList)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                .shadow(color: .shadow, radius: 2, x: 0.0, y: 3)
                .padding(.horizontal)
            
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(name)
                        .foregroundStyle(.accent)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(price)
                        .foregroundStyle(.brown)
                }
                
                Spacer()
                
                HStack {
                    ZStack {
                        Rectangle()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.coffeeList)
                        
                        Image(systemName: "minus")
                            .fontWeight(.bold)
                    }
                    .onTapGesture {
                        removeCoffeeAction()
                    }
                    
                    Text("\(numberOfCups)")
                        .fontWeight(.bold)
                    
                    Image(systemName: "plus")
                        .fontWeight(.bold)
                        .onTapGesture {
                            addCoffeeAction()
                        }
                    
                    Spacer()
                        .frame(width: 10)
                }
                .foregroundStyle(.accent)
                
            }
            .padding(.horizontal, 30)
        }
    }
}

//#Preview {
//    BuyListItemUI(name: "Горячий шоколад", price: "200 руб", numberOfCups: 1)
//}
