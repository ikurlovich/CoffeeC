import Foundation

public enum HttpMethod: String {
    case get,
         post,
         put,
         delete
}

public extension URLRequest {
    init?(
        httpMethod: HttpMethod = .get,
        path: String,
        body: Encodable? = nil
    ) {
        let baseUrl = "http://147.78.66.203:3210/"
        let urlString = baseUrl + path
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        self.init(url: url)
        self.httpMethod = httpMethod.rawValue.uppercased()
        self.setValue("application/json", forHTTPHeaderField: "Accept")
        self.setValue("application/json", forHTTPHeaderField: "Content-Type")
        self.setValue("BisquitAPPLE", forHTTPHeaderField: "User-Agent")
        
//        if let apiKey = Keychain.load(key: "selectedApiKey") {
        self.setValue("Bearer \(NavigatorView().token)", forHTTPHeaderField: "Authorization")
//        } else {
//            print("Error fetching value from Keychain")
//        }
        
        if let body {
            do {
                self.httpBody = try JSONEncoder().encode(body)
                self.addValue("application/json", forHTTPHeaderField: "Content-Type")
            } catch {
                return nil
            }
        }
    }
}
