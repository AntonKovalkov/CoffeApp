//
//  NetworkService.swift
//  CoffeApp
//
//  Created by Anton Kovalkov on 23.12.2023.
//

import Foundation

protocol NetworkService {
    func sendRequest<T: Decodable>(endpoint: EndpointProtocol, responseModel: T.Type) async -> Result<T, RequestError>
}

extension NetworkService {
    func sendRequest<T>(endpoint: EndpointProtocol, responseModel: T.Type) async -> Result<T, RequestError> where T : Decodable {
        let host = endpoint.host
        let path = endpoint.path
        
        guard let url = URL(string: host + path) else { return .failure(.invalidURL)}
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        
        if let body = endpoint.body {
            request.httpBody = body
        }
        
        print("\(request.httpMethod!) \(request.url!)")
        print("Headers:")
        print(request.allHTTPHeaderFields!)
        print("Body:")
        print(String(data: request.httpBody ?? Data(), encoding: .utf8)!)
        
        do {
            let config = URLSessionConfiguration.default
            config.requestCachePolicy = .reloadIgnoringLocalCacheData
            config.urlCache = nil
            config.timeoutIntervalForResource = 6

            let session = URLSession(configuration: config)
            let (data, response) = try await session.data(for: request)
            guard let response = response as? HTTPURLResponse else { return .failure(.noResponse)}
            print(response)
            switch response.statusCode {
            case 200...299:
                guard let decodeResponse = try? JSONDecoder().decode(responseModel, from: data) else { return .failure(.responseWithoutData)}
                return .success(decodeResponse)
            case 400:
                return .failure(.userAlredyExists)
            case 401:
                return .failure(.uncorrectData)
            case 404:
                return .failure(.userNotFound)
            case 422:
                return .failure(.validationError)
            case 500:
                return .failure(.serverError)
            default:
                return .failure(.unexpectedStatusCode)
            }
            
        } catch {
            return .failure(.unknown)
        }
    }
}
