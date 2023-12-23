//
//  UserEndpoint.swift
//  CoffeApp
//
//  Created by Anton Kovalkov on 23.12.2023.
//

import Foundation

//MARK: - User endpoint
enum UserEndpoint {
    case registartion(login: String, password: String)
    case authorization(login: String, password: String)
}

extension UserEndpoint: EndpointProtocol {
    var path: String {
        switch self {
        case .registartion: return "/auth/register"
        case .authorization: return "/auth/login"
        }
    }
    
    //MARK: -Method
    var method: RequestMethod {
        switch self {
        case .registartion, .authorization: return .post
        }
    }
    
    //MARK: - Headers
    var header: [String : String]? {
        switch self {
        case .registartion, .authorization:
            return ["accept": "application/json",
                    "Content-Type": "application/json"]
        }
    }
    
    //MARK: - Body
    var body: Data? {
        switch self {
        case .registartion(let login, let password), .authorization(let login, let password):
            let parameters: [String: String] = ["login": login,
                                                "password": password]
            return parameters.getBody()
        }
    }
}
