//
//  ArrowToolBarUI.swift
//  CoffeeC
//
//  Created by Илья Курлович on 11.02.2024.
//

import SwiftUI

struct ArrowToolBarUI: ViewModifier {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(name)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.accent)
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .frame(width: 8, height: 12)
                            .font(.headline)
                            .foregroundStyle(.accent)
                            .padding(5)
                    }
                }
            }
    }
}

extension View {
    func arrowToolBarUI(name: String) -> some View {
        modifier(ArrowToolBarUI(name: name))
    }
}
