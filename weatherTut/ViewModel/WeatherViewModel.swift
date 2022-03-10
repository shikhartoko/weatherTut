//
//  WeatherViewModel.swift
//  weatherTut
//
//  Created by Shikhar Sharma on 10/03/22.
//

import Foundation
import UIKit

public class WeatherViewModel {
    let locationName = Box("Loading..")
    let tempDescriptionList = Box([WeatherDescription]())
    
    private static let defaultAddress = "New Delhi"
    
    func changeLocation (to newLocation: String) {
        locationName.value = "Loading"
        if (isValidLocation(location: newLocation)) {
            ApiFunctions.fetchWeatherData(city: newLocation) { data in
                self.tempDescriptionList.value = data.list
                self.locationName.value = newLocation
            }
        }
    }
    func isValidLocation (location: String) -> Bool {
        return true
    }
    
    init() {
      changeLocation(to: Self.defaultAddress)
    }
}
