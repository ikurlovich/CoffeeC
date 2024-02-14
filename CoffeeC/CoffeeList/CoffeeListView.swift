import SwiftUI

struct CoffeeListView: View {
    @StateObject var vm = CoffeeVM()
    @State private var isButtonPressed = false
    
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
            
            UniversalButtonUI("На карте") {
                isButtonPressed = true
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
        .navigationDestination(isPresented: $isButtonPressed) {
            CoffeeMapView()
        }
    }
}

#Preview {
    NavigationStack {
        CoffeeListView()
    }
}
