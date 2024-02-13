import Foundation

struct LocationRespond: Codable, Identifiable {
    let id: Int
    let name: String
    let point: Point
}
