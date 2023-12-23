//
//  EndpointProtocol.swift
//  CoffeApp
//
//  Created by Anton Kovalkov on 23.12.2023.
//

import Foundation

protocol EndpointProtocol {
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: Data? { get }
}

extension EndpointProtocol {
    var host: String {
        return APPConfig().API_URL
    }
}
