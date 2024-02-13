//
//  APIManager.swift
//  CoffeeC
//
//  Created by Илья Курлович on 11.02.2024.
//

import Foundation
import Alamofire

class APIManager {
    static let shared = APIManager()
    private let baseURL = "http://147.78.66.203:3210"
    
    private init() {}
    
    func login(loginData: LoginData, completion: @escaping (Result<AuthResponse, Error>) -> Void) {
        let url = "\(baseURL)/auth/login"
        AF.request(url, method: .post, parameters: loginData, encoder: JSONParameterEncoder.default).responseDecodable(of: AuthResponse.self) { response in
            switch response.result {
            case .success(let authResponse):
                completion(.success(authResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func register(loginData: LoginData, completion: @escaping (Result<AuthResponse, Error>) -> Void) {
        let url = "\(baseURL)/auth/register"
        AF.request(url, method: .post, parameters: loginData, encoder: JSONParameterEncoder.default).responseDecodable(of: AuthResponse.self) { response in
            switch response.result {
            case .success(let authResponse):
                completion(.success(authResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getLocationMenu(id: String, completion: @escaping (Result<[LocationMenuRespond], Error>) -> Void) {
        let url = "\(baseURL)/location/\(id)/menu"
        AF.request(url).responseDecodable(of: [LocationMenuRespond].self) { response in
            switch response.result {
            case .success(let locationMenuRespond):
                completion(.success(locationMenuRespond))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getLocations(completion: @escaping (Result<[LocationRespond], Error>) -> Void) {
        let url = "\(baseURL)/locations"
        AF.request(url).responseDecodable(of: [LocationRespond].self) { response in
            switch response.result {
            case .success(let locationRespond):
                completion(.success(locationRespond))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

