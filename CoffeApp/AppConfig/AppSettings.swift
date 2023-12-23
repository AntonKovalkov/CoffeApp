//
//  APPSettings.swift
//  CoffeApp
//
//  Created by Anton Kovalkov on 23.12.2023.
//

import Foundation

//MARK: - App settings
class AppSettings {
    private static let languageKey = "language"
    
    //MARK: - Language
    static func getLanguages() -> Languages {
        let defaults = UserDefaults.standard
        if let languagesString = defaults.string(forKey: languageKey) {
            let languages: Languages = Languages.ru.rawValue == languagesString ? .ru : .en
            return languages
        }
        
        var lang: String?
        if #available(iOS 16.0, *) {
            lang = NSLocale.current.language.languageCode?.identifier
        } else {
            lang = NSLocale.current.languageCode
        }
        
        if lang == "en" {
            return .en
        } else {
            return .ru
        }
    }
    
    static func setLanguage(_ language: Languages) {
        let defaults = UserDefaults.standard
        defaults.setValue(language.rawValue, forKey: languageKey)
    }
}


enum Languages: String {
    case ru = "ru"
    case en = "en"
}
