import Foundation

struct AuthResponse: Codable {
    let token: String
    let tokenLifetime: Int32
}
