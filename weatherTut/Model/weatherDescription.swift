//
//  weatherDescription.swift
//  weatherTut
//
//  Created by Shikhar Sharma on 03/03/22.
//

import Foundation

struct WeatherDescription: Codable {
    let dt : Double
    let humidity : Double
    let pressure : Double
    let temp : Temp
    let wind_speed : Double
}
