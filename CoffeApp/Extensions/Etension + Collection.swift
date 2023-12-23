//
//  Etension + Collection.swift
//  CoffeApp
//
//  Created by Anton Kovalkov on 23.12.2023.
//

import Foundation

extension Collection {
    func getBody() -> Data? {
        do {
            let body = try JSONSerialization.data(withJSONObject: self)
            return body
        } catch {
            return nil
        }
    }
}
