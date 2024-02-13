//
//  CoffeeMenuView.swift
//  CoffeeC
//
//  Created by Илья Курлович on 12.02.2024.
//

import SwiftUI

struct CoffeeMenuView: View {
    @StateObject var vm = CoffeeCViewModel()
    @State private var isButtonPressed = false
    @State private var numberOfCups = 0
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(vm.coffeeMenuMock) { coffee in
                        VStack(spacing: 0) {
                            Image(coffee.imageURL)
                                .resizable()
                                .scaledToFill()
                            
                            ZStack {
                                Rectangle()
                                    .frame(height: 70)
                                    .foregroundStyle(.menuBack)
                                
                                VStack {
                                    HStack {
                                        Spacer()
                                            .frame(width: 10)
                                        
                                        Text(coffee.name)
                                            .foregroundStyle(.accent)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Spacer()
                                            .frame(width: 10)
                                        
                                        Text("\((coffee.price)) руб")
                                            .fontWeight(.bold)
                                            .foregroundStyle(.accent)
                                        
                                        Spacer()
                                        
                                        HStack {
                                            ZStack {
                                                Rectangle()
                                                    .frame(width: 20, height: 20)
                                                    .foregroundStyle(.menuBack)
                                                
                                                Image(systemName: "minus")
                                            }
                                            .onTapGesture {
                                                vm.removeCoffeeFromOrder(coffeeName: coffee.name)
                                            }
                                            
                                            Text("\(vm.coffeeOrderCount[coffee.name, default: 0])")
                                                .foregroundStyle(.accent)
                                                .fixedSize(horizontal: true, vertical: false)
                                            
                                            Image(systemName: "plus")
                                                .onTapGesture {
                                                    vm.addCoffeeToOrder(coffeeName: coffee.name)
                                                }
                                            
                                            Spacer()
                                                .frame(width: 10)
                                        }
                                        .foregroundStyle(.buttonText)
                                    }
                                }
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(color: .shadow, radius: 2, x: 0.0, y: 3)
                    }
                }
                .padding()
            }
            UniversalButtonUI(buttonText: "Перейти к оплате", buttonAction: { goToNextPage() })
                .padding(.horizontal, 20)
        }
        .arrowToolBarUI(name: "Меню")
        .navigationDestination(
            isPresented: $isButtonPressed) {
                CoffeePayView(vm: vm)
            }
    }
    private func goToNextPage() {
        isButtonPressed = true
    }
    
}

#Preview {
    NavigationStack {
        CoffeeMenuView()
    }
}

