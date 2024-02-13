import Foundation

final class CoffeeVM: ObservableObject {
    @Published var coffeeShopsMock: [LocationRespond] = []
    
    func getLocations() {
        APIManager().getLocations(printResponse: true) { result in
            switch result {
            case .success(let model):
                if let model {
                    self.coffeeShopsMock = model
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
