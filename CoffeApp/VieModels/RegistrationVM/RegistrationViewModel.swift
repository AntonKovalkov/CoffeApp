//
//  RegistrationViewModel.swift
//  CoffeApp
//
//  Created by Anton Kovalkov on 23.12.2023.
//

import Foundation

enum RegistartionState {
    case initial
    case loading
    case success
    case failure(error: String)
}

protocol RegistrationViewModelProtocol {
    var viewUpdate: ((RegistartionState) -> Void)? { get set }
    func register(email: String, password: String)
}

class RegistrationViewModel: RegistrationViewModelProtocol {
    var viewUpdate: ((RegistartionState) -> Void)?
    private let userService = UserService()
    
    init() {
        viewUpdate?(.initial)
    }
    
    func register(email: String, password: String) {
        viewUpdate?(.loading)
        
        Task(priority: .background) {
            let result = await userService.register(email: email, password: password)
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
