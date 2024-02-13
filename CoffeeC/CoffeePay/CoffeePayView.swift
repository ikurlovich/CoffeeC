//
//  CoffeePayView.swift
//  CoffeeC
//
//  Created by Илья Курлович on 13.02.2024.
//

import SwiftUI

struct CoffeePayView: View {
    @ObservedObject var vm: CoffeeCViewModel
    @State private var showsAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        VStack {
            ScrollView {
                Spacer()
                    .frame(height: 15)
                
                ForEach(vm.coffeeMenuMock, id: \.id) { coffee in
                    if let orderCount = vm.coffeeOrderCount[coffee.name], orderCount > 0 {
                        BuyListItemUI(
                            name: coffee.name,
                            price: "\(coffee.price * Int32(orderCount)) руб",
                            numberOfCups: orderCount,
                            addCoffeeAction: { vm.addCoffeeToOrder(coffeeName: coffee.name) },
                            removeCoffeeAction: { vm.removeCoffeeFromOrder(coffeeName: coffee.name) }
                        )
                    }
                }
            }
            UniversalButtonUI(buttonText: "Оплатить", buttonAction: makeOrder)
                .padding(.horizontal, 20)
        }
        .arrowToolBarUI(name: "Меню")
        .alert(isPresented: $showsAlert) {
            Alert(
                title: Text(alertTitle),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    private func makeOrder() {
        let total = vm.coffeeMenuMock.reduce(0) { sum, coffee in
            let count = vm.coffeeOrderCount[coffee.name, default: 0]
            return sum + Int(coffee.price * Int32(count))
        }
        if total > 0 {
            alertTitle = "Покупка совершена успешно"
            alertMessage = "Ваша общая сумма заказа составляет \(total) руб."
        } else {
            alertTitle = "Вы не выбрали товар"
            alertMessage = "Пожалуйста, выберите напиток для заказа"
        }
        self.showsAlert = true
    }
}

#Preview {
    NavigationStack {
        let viewModel = CoffeeCViewModel()
        CoffeePayView(vm: viewModel)
    }
}
