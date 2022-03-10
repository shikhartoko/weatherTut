//
//  apiFunctions.swift
//  weatherTut
//
//  Created by Shikhar Sharma on 03/03/22.
//

import Foundation

import Moya

// do everything inside a class or struct

// create a class and make it a static function
class ApiFunctions {
    static func fetchWeatherData(city : String, completion: @escaping (WeatherResponse) -> Void) {
        let provider = MoyaProvider<Api>()
        provider.request(.forecast30(city: city)) { result in
            switch result {
            case .success(let response):
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let result = try decoder.decode(WeatherResponse.self, from: response.data)
                    completion(result)
                    
                } catch let error {
                    print("Error occured \(error)")
                }
            case .failure:
              // 5
              print("Failure")
            }
        }
    }
}

