//
//  CoffeeListView.swift
//  CoffeeC
//
//  Created by Илья Курлович on 11.02.2024.
//

import SwiftUI

struct CoffeeListView: View {
    @StateObject var vm = CoffeeCViewModel()
    
    @State private var isButtonPressed = false
    @State private var isShowMenu = false
    
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
            
            UniversalButtonUI("На карте") {
                goToNextPage()
            }
            .padding(.horizontal, 20)
            
            UniversalButtonUI("Выйти") {
                withAnimation {
                    NavigatorView().token = ""
                }
            }
            .padding(.horizontal, 20)
        }
        .arrowToolBarUI(name: "Ближайшие кофейни")
        .navigationDestination(isPresented: $isButtonPressed) {
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
