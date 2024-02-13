import Foundation

public func prettyJSON(_ data: Data?) {
    do {
        if let data,
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            
            let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
            
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
            }
        }
    } catch {
        print("Failed to create pretty JSON: \(error)")
    }
}
