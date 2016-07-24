//
//  DateFormatter.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Joe Sherratt on 04/07/2016.
//  Copyright © 2016 BlueFlameApps. All rights reserved.
//

import Foundation

//-----------------------
//MARK: Structs
//-----------------------
struct DateFormatter {
    
    //-----------------------
    //MARK: Variables
    //-----------------------
    static var dateFormatter = NSDateFormatter()
    
    //-----------------------
    //MARK: Functions
    //-----------------------
    
    //Convert and format from a sting to a date
    static func convertString(toDate date: String) throws -> NSDate {
        
        dateFormatter.dateFormat = "MM/dd/yy"
        dateFormatter.dateStyle = .ShortStyle
        
        guard let convertedDate: NSDate = dateFormatter.dateFromString(date) else {
            
            throw Error.IncorrectDateFormat
        }
        return convertedDate
    }
    
    //Convert and format from a date to a string
    static func convertDate(toString date: NSDate) throws -> String {
        
        dateFormatter.dateFormat = "MM/dd/yy"
        dateFormatter.dateStyle = .ShortStyle
        
        guard let convertedDate: String = dateFormatter.stringFromDate(date) else {
            
            throw Error.IncorrectDateFormat
        }
        return convertedDate
    }
}