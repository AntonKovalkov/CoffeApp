//
//  Extension + String.swift
//  CoffeApp
//
//  Created by Anton Kovalkov on 23.12.2023.
//

import Foundation

extension String {
    func localized() -> String {
        let selectedLanguage = AppSettings.getLanguages()
        guard let path = Bundle.main.path(forResource: selectedLanguage.rawValue, ofType: "lproj") else {return "ERROR LOCAL"}
        let bundle = Bundle(path: path)
        return bundle?.localizedString(forKey: self, value: "", table: nil) ?? "ERROR LOCAL"
    }
}
