//
//  weatherResponse.swift
//  weatherTut
//
//  Created by Shikhar Sharma on 03/03/22.
//

import Foundation

struct WeatherResponse: Codable {
    let cod : String
    let city : City
    let message : Double
    let list : [WeatherDescription]
}

struct WeatherDescription: Codable {
    let dt : String
    let humidity : Double
    let pressure : Double
    let temp : Temp
    let windSpeed : Double
    
    enum Codingkeys : String, CodingKey {
        case dt
        case humidity
        case pressure
        case temp
        case windSpeed
    }
    
    internal init(from decoder: Decoder) throws {
        let response = try decoder.container(keyedBy: CodingKeys.self)
        let dtTimeStamp = try response.decodeIfPresent(Double.self, forKey: .dt)
        let dateformatter = DateFormatter()
        dt = dateformatter.dateTimeFormatted(unixTimeStamp: dtTimeStamp)
        humidity = try response.decodeIfPresent(Double.self, forKey: .humidity)!
        pressure = try response.decodeIfPresent(Double.self, forKey: .pressure)!
        temp = try response.decodeIfPresent(Temp.self, forKey: .temp)!
        windSpeed = try response.decodeIfPresent(Double.self, forKey: .windSpeed)!
    }
    
}

struct Temp: Codable {
    let average : Double
    let averageMax : Double
    let averageMin : Double
    let recordMax : Double
    let recordMin : Double
}

struct City : Codable{
    let id : Int
    let name : String
    let country : String
    let coord : Cords
}

struct Cords : Codable{
    let lon : Double
    let lat : Double
}
