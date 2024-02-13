//
//  AuthResponse.swift
//  CoffeeC
//
//  Created by Илья Курлович on 11.02.2024.
//

import Foundation

struct AuthResponse: Codable {
    let token: String
    let tokenLifetime: Int32
}
