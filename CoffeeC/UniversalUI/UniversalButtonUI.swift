//
//  RegistrationButtonUI.swift
//  CoffeeC
//
//  Created by Илья Курлович on 11.02.2024.
//

import SwiftUI

struct UniversalButtonUI: View {
    var buttonText: String
    var buttonAction: () -> Void

    var body: some View {
        VStack {
            Button(action: buttonAction) {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.button)
                        .frame(height: 55)
                        .clipShape(.capsule)
                    
                    Text(buttonText)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.buttonText)
                }
            }
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    UniversalButtonUI(buttonText: "Пример") {
        print("Registration done")
    }
}
