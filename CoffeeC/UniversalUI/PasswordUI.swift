//
//  PasswordUI.swift
//  CoffeeC
//
//  Created by Илья Курлович on 10.02.2024.
//

import SwiftUI

struct PasswordUI: View {
    @Binding var password: String
    var name: String
    
    var body: some View {
        VStack {
            HStack {
                Text(name)
                    .foregroundStyle(.accent)
                Spacer()
            }
            
            HStack() {
                SecureField("******", text: $password)
                    .padding()
                    .foregroundStyle(.accent)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.accent, lineWidth: 2)
                    )
            }
        }
    }
}

#Preview {
    PasswordUI(password: .constant(""), name: "Пример")
}
