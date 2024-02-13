//
//  CoffeeListItemUI.swift
//  CoffeeC
//
//  Created by Илья Курлович on 11.02.2024.
//

import SwiftUI

struct CoffeeListItemUI: View {
    var name: String
    var distance: String
    
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
                    Text(distance)
                        .foregroundStyle(.brown)
                }
                
                Spacer()
            }
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    CoffeeListItemUI(name: "BEDOEV COFFEE", distance: "200 руб")
}
