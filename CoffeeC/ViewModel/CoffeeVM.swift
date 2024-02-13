//
//  CoffeeCViewModel.swift
//  CoffeeC
//
//  Created by Илья Курлович on 11.02.2024.
//

import Foundation

final class CoffeeVM: ObservableObject {
    @Published var coffeeShopsMock: [LocationRespond] = [
        LocationRespond(id: 1, name: "BEDOEV COFFEE", point: Point(latitude: 44.71, longitude: 37.76)),
        LocationRespond(id: 2, name: "Coffee Like", point: Point(latitude: 44.70, longitude: 37.777)),
        LocationRespond(id: 3, name: "EM&DI Coffee and Snacks", point: Point(latitude: 44.693, longitude: 37.765)),
        LocationRespond(id: 4, name: "Коффе есть", point: Point(latitude: 44.685, longitude: 37.777)),
        LocationRespond(id: 5, name: "Набоков", point: Point(latitude: 44.68, longitude: 37.76))
    ]
    
    @Published var coffeeMenuMock: [LocationMenuRespond] = [
        LocationMenuRespond(id: 1, name: "Эспрессо", imageURL: "espresso", price: 130),
        LocationMenuRespond(id: 2, name: "Капучино", imageURL: "cappuccino", price: 150),
        LocationMenuRespond(id: 3, name: "Горячий шоколад", imageURL: "hotChocolate", price: 140),
        LocationMenuRespond(id: 4, name: "Латте", imageURL: "latte", price: 190)
    ]
    
    @Published var coffeeOrderCount: [String: Int] {
        didSet {
            UserDefaults.standard.set(coffeeOrderCount, forKey: "coffeeOrderCount")
        }
    }
    
    init() {
        self.coffeeOrderCount = UserDefaults.standard.dictionary(forKey: "coffeeOrderCount") as? [String: Int] ?? [:]
    }
    
    func addCoffeeToOrder(coffeeName: String) {
        let currentCount = coffeeOrderCount[coffeeName, default: 0]
        coffeeOrderCount[coffeeName] = currentCount + 1
    }
    
    func removeCoffeeFromOrder(coffeeName: String) {
        let currentCount = coffeeOrderCount[coffeeName, default: 0]
        coffeeOrderCount[coffeeName] = max(currentCount - 1, 0)
    }
}
