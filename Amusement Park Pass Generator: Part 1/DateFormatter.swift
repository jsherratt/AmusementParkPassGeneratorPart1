//
//  DateFormatter.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Joe Sherratt on 04/07/2016.
//  Copyright © 2016 BlueFlameApps. All rights reserved.
//

import Foundation

struct DateFormatter {
    
    static var dateFormatter = NSDateFormatter()
    
    static func formatDateFromString(date: String) throws -> NSDate {
        
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        guard let convertedDate: NSDate = dateFormatter.dateFromString(date) else {
            
            throw Error.IncorrectDateFormat
        }
        return convertedDate
    }
}