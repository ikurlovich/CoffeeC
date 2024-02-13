import SwiftUI

final class CoffeeMenuVM: ObservableObject {
    init() {
        coffeeOrderCount = UserDefaults.standard.dictionary(forKey: "coffeeOrderCount") as? [String: Int] ?? [:]
    }
    
    @Published var menu: [LocationMenuRespond] = []
    
    @Published var coffeeOrderCount: [String: Int] {
        didSet {
            UserDefaults.standard.set(coffeeOrderCount, forKey: "coffeeOrderCount")
        }
    }
    
    func addCoffeeToOrder(coffeeName: String) {
        let currentCount = coffeeOrderCount[coffeeName, default: 0]
        coffeeOrderCount[coffeeName] = currentCount + 1
    }
    
    func removeCoffeeFromOrder(coffeeName: String) {
        let currentCount = coffeeOrderCount[coffeeName, default: 0]
        coffeeOrderCount[coffeeName] = max(currentCount - 1, 0)
    }
    
    func getLocationMenu(id: Int) {
        APIManager().getLocationMenu(id: id, printResponse: true) { result in
            switch result {
            case .success(let model):
                if let model {
                    self.menu = model
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
