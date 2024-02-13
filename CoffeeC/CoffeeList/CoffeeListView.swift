//
//  CoffeeListView.swift
//  CoffeeC
//
//  Created by Илья Курлович on 11.02.2024.
//

import SwiftUI

struct CoffeeListView: View {
    @State private var isButtonPressed = false
    @State private var isShowMenu = false
    @StateObject var vm = CoffeeCViewModel()
    
    var body: some View {
        VStack {
            ScrollView() {
                Spacer()
                    .frame(height: 15)
                
                ForEach(vm.coffeeShopsMock) { coffeeShop in
                    CoffeeListItemUI(name: coffeeShop.name, distance: "1 км от вас")
                        .onTapGesture {
                            goToMenu()
                        }
                }
            }
            UniversalButtonUI(buttonText: "На карте", buttonAction: { goToNextPage() })
                .padding(.horizontal, 20)
        }
        .arrowToolBarUI(name: "Ближайшие кофейни")
        .navigationDestination(
            isPresented: $isButtonPressed) {
                if isShowMenu {
                    CoffeeMenuView()
                } else {
                    CoffeeMapView()
                }
            }
    }
    
    private func goToMenu() {
        isShowMenu = true
        isButtonPressed = true
    }
    
    private func goToNextPage() {
        isShowMenu = false
        isButtonPressed = true
    }
}

#Preview {
    NavigationStack {
        CoffeeListView()
    }
}
