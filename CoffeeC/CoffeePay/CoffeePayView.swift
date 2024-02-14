import SwiftUI

struct CoffeePayView: View {
    @ObservedObject var vm: CoffeeMenuVM
    
    @State private var showsAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showTextDelivery = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                if showTextDelivery {
                    Text("Время ожидания заказа\n15 минут!\nСпасибо, что выбрали нас!")
                        .font(.title)
                        .foregroundStyle(.accent)
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
                    .frame(height: 150)
            }
            
            VStack {
                ScrollView {
                    Spacer()
                        .frame(height: 15)
                    
                    ForEach(vm.menu, id: \.id) { coffee in
                        if let orderCount = vm.coffeeOrderCount[coffee.name], orderCount > 0 {
                            BuyListItemUI(
                                name: coffee.name.count > 15 ? "Просто кофе" : coffee.name,
                                price: "\(coffee.price * Int32(orderCount)) руб",
                                numberOfCups: orderCount,
                                addCoffeeAction: { vm.addCoffeeToOrder(coffeeName: coffee.name) },
                                removeCoffeeAction: { vm.removeCoffeeFromOrder(coffeeName: coffee.name) }
                            )
                        }
                    }
                }
                
                UniversalButtonUI("Оплатить", buttonAction: makeOrder)
                    .padding(.horizontal, 20)
            }
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
        let total = vm.menu.reduce(0) { sum, coffee in
            let count = vm.coffeeOrderCount[coffee.name, default: 0]
            return sum + Int(coffee.price * Int32(count))
        }
        
        if total > 0 {
            alertTitle = "Покупка совершена успешно"
            alertMessage = "Ваша общая сумма заказа составляет \(total) руб."
            showTextDelivery = true
        } else {
            alertTitle = "Вы не выбрали товар"
            alertMessage = "Пожалуйста, выберите напиток для заказа"
        }
        
        showsAlert = true
    }
}

#Preview {
    NavigationStack {
        let viewModel = CoffeeMenuVM()
        CoffeePayView(vm: viewModel)
    }
}
