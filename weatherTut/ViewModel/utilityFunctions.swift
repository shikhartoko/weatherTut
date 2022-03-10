//
//  utilityFunctions.swift
//  weatherTut
//
//  Created by Shikhar Sharma on 03/03/22.
//

import Foundation

extension DateFormatter {
    func dateTimeFormatted (unixTimeStamp : Double?) -> String {
        if unixTimeStamp == nil {
            return "No Time Stamp returned"
        }
        if let timeResult = (unixTimeStamp as? Double?) {
            let date = Date(timeIntervalSince1970: timeResult!)
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
            dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
            dateFormatter.timeZone = .current
            let localDate = dateFormatter.string(from: date)
            return localDate
        }
        return "Invalid Time Stamp"
    }
}
