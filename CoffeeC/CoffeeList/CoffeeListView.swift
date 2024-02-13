import SwiftUI

struct CoffeeListView: View {
    @StateObject var vm = CoffeeVM()
    
    var body: some View {
        VStack {
            ScrollView() {
                Spacer()
                    .frame(height: 15)
                
                ForEach(vm.coffeeShopsMock) { coffeeShop in
                    NavigationLink {
                        CoffeeMenuView(coffeeShop.id)
                    } label: {
                        CoffeeListItemUI(name: coffeeShop.name, distance: "1 км от вас")
                    }
                }
            }
            
            UniversalButtonUI("Выйти") {
                withAnimation {
                    NavigatorView().token = ""
                }
            }
            .padding(.horizontal, 20)
        }
        .task {
            vm.getLocations()
        }
        .refreshable {
            vm.getLocations()
        }
        .arrowToolBarUI(name: "Ближайшие кофейни")
    }
}

#Preview {
    NavigationStack {
        CoffeeListView()
    }
}
