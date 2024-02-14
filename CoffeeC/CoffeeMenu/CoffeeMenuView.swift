import SwiftUI
import Kingfisher

struct CoffeeMenuView: View {
    @StateObject var vm = CoffeeMenuVM()
    
    @State private var isButtonPressed = false
    @State private var numberOfCups = 0
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    private let id: Int
    
    init(_ id: Int) {
        self.id = id
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(vm.menu, id: \.id) { coffee in
                            VStack(spacing: 0) {
                                KFImage(URL(string: coffee.imageURL)!)
                                    .resizable()
                                    .frame(width: geometry.size.width / 2 - 20, height: geometry.size.width / 2 - 50, alignment: .center)
                                
                                ZStack {
                                    Rectangle()
                                        .frame(height: 70)
                                        .foregroundStyle(.menuBack)
                                    
                                    VStack {
                                        HStack {
                                            Spacer()
                                                .frame(width: 10)
                                            
                                            Text(coffee.name.count > 15 ? "Просто кофе" : coffee.name)
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
                            .frame(width: geometry.size.width / 2 - 20, height: geometry.size.width / 2 + 20, alignment: .center)
                            .clipShape(.rect(cornerRadius: 15))
                            .shadow(color: .shadow, radius: 2, x: 0.0, y: 3)
                        }
                    }
                    .padding()
                }
                
                UniversalButtonUI("Перейти к оплате") {
                    goToNextPage()
                }
                .padding(.horizontal, 20)
            }
        }
        .arrowToolBarUI(name: "Меню")
        .navigationDestination(isPresented: $isButtonPressed) {
            CoffeePayView(vm: vm)
        }
        .task {
            vm.getLocationMenu(id: id)
        }
    }
    
    private func goToNextPage() {
        isButtonPressed = true
    }
    
}

#Preview {
    NavigationStack {
        CoffeeMenuView(0)
    }
}

