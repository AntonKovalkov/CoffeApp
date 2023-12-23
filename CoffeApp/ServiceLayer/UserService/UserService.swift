//
//  UserService.swift
//  CoffeApp
//
//  Created by Anton Kovalkov on 23.12.2023.
//

import Foundation

protocol UserServiceable {
    func register(email: String, password: String) async -> Result<NUserModel, RequestError>
    func athorization(email: String, password: String) async -> Result<NUserModel, RequestError>
}

struct UserService: UserServiceable, NetworkService {
    func register(email: String, password: String) async -> Result<NUserModel, RequestError> {
        return await sendRequest(endpoint: UserEndpoint.registartion(login: email, password: password), responseModel: NUserModel.self)
    }
    
    func athorization(email: String, password: String) async -> Result<NUserModel, RequestError> {
        return await sendRequest(endpoint: UserEndpoint.authorization(login: email, password: password), responseModel: NUserModel.self)
    }
}
