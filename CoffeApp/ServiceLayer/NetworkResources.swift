//
//  NetworkResources.swift
//  CoffeApp
//
//  Created by Anton Kovalkov on 23.12.2023.
//

import Foundation

//MARK: - Methods
enum RequestMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
}

//MARK: - Errors
enum RequestError: Error {
    case userNotFound
    case userAlredyExists
    case uncorrectData
    case serverError
    case validationError
    case decode
    case invalidURL
    case noResponse
    case responseWithoutData
    case unexpectedStatusCode
    case unknown
    
    var customMessage: String {
        switch self {
        case .userNotFound:
            return "apiUserNotFound".localized()
        case .userAlredyExists:
            return "apiUserAlredyExists".localized()
        case .uncorrectData:
            return "apiUncorrectData".localized()
        case .serverError:
            return "apiServerError".localized()
        case .decode:
            return "apiDecode".localized()
        case .validationError: return "apiValidationError".localized()
        default:
            return "apiUnkmnown".localized()
        }
    }
}

struct SimpleResponseModel: Codable {
    var detail: String
    
    enum CodingKeys: CodingKey {
        case detail
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.detail = try container.decode(String.self, forKey: .detail)
    }
}
