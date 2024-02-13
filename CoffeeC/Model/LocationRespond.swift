//
//  LocationRespond.swift
//  CoffeeC
//
//  Created by Илья Курлович on 11.02.2024.
//

import Foundation

struct LocationRespond: Codable, Identifiable {
    let id: Int
    let name: String
    let point: Point
}
