import Foundation

public func processResponse <T: Decodable> (
    _ data: Data?,
    _ response: URLResponse?,
    _ error: Error?
) -> Result <T?, Error> {
    if let error {
        return .failure(error)
    }
    
    guard let data else {
        return .failure(Errors.noDataRecieved)
    }
    
    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let value = try decoder.decode(T.self, from: data)
        
        return .success(value)
    } catch {
        print("Decoding error: \(error)")
        if let httpResponse = response as? HTTPURLResponse {
            let statusCode = httpResponse.statusCode
            
            if (200...299).contains(statusCode) {
                return .success(nil)
            } else {
                print("Status code: \(statusCode)")
                return .failure(error)
            }
        } else {
            return .failure(error)
        }
    }
}
