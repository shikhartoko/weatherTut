//
//  Api.swift
//  weatherTut
//
//  Created by Shikhar Sharma on 02/03/22.
//

import Foundation

import Moya

enum Api {
    case forecast30(city: String)
}

extension Api: TargetType {
    var headers: [String : String]? {
        return [
            "x-rapidapi-host": "community-open-weather-map.p.rapidapi.com",
            "x-rapidapi-key": "44e92e81b5msh7b6c27c2a1331aap1f24e1jsn6b70167f6b79"
        ]
    }
    
    var baseURL: URL {
        guard let url = URL(string: "https://community-open-weather-map.p.rapidapi.com/climate/month") else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .forecast30(city: let city):
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .forecast30(city: _):
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
//    "https://community-open-weather-map.p.rapidapi.com/climate/month?q=New%20Delhi"
    var task: Task {
        switch self {
        case .forecast30(city: let city):
            return .requestParameters(
                parameters: [ "q": city], encoding: URLEncoding.queryString)
        }
    }
}
