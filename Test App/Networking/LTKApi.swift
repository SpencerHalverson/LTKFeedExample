//
//  LTKApi.swift
//  Test App
//
//  Created by Spencer Halverson  on 3/31/23.
//

import Foundation
import Combine
import UIKit

struct LTKApi {
    
    static let apiBaseUrl: String = "https://api-gateway.rewardstyle.com/api/ltk/v2/"
    
    static let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    static func makeRequest(endpoint: String) -> AnyPublisher<Data, Error> {
        let url = URL(string: endpoint)!
    
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .eraseToAnyPublisher()
    }
    
    static func getFeatured(featured: Bool, limit: Int) -> AnyPublisher<FeedResult, Error> {
        let featuredEndpoint = apiBaseUrl + "ltks/?featured=\(featured.description)&limit=\(limit)"

        return makeRequest(endpoint: featuredEndpoint)
            .decode(type: FeedResult.self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }
    
    static func getProduct(id: String) -> AnyPublisher<ProductResult, Error> {
        let productEndpoint = apiBaseUrl + "products/\(id)"
        
        return makeRequest(endpoint: productEndpoint)
            .decode(type: ProductResult.self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }
    
    static func getProfile(id: String) -> AnyPublisher<ProfileResult, Error> {
        let profileEndpoint = apiBaseUrl + "profiles/\(id)"

        return makeRequest(endpoint: profileEndpoint)
            .decode(type: ProfileResult.self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
    }
}
