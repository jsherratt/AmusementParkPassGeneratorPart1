//
//  Guest.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Joe Sherratt on 04/07/2016.
//  Copyright © 2016 BlueFlameApps. All rights reserved.
//

import Foundation

//-----------------------
//MARK: Protocols
//-----------------------
protocol GuestType: Entrant {
    
    var dateOfBirth: NSDate? { get }
    var guestType: Guests { get }
}

//-----------------------
//MARK: Enums
//-----------------------

//Different types of guests
enum Guests {
    
    case Classic
    case VIP
    case FreeChild
}

struct Guest: GuestType {
    
    var pass: Pass?
    var guestType: Guests
    var dateOfBirth: NSDate?
    
    init(dateOfbirth: String?, guestType: Guests) throws {
        
        func childIsYoungerThanFive (date: NSDate) -> Bool {
            
            let currentDate = NSDate()
            let calender = NSCalendar.currentCalendar()
            let components = calender.components(.Year, fromDate: date, toDate: currentDate, options: .MatchFirst)
            
            if components.year <= 5 {
                return true
            }else {
                return false
            }
        }
        
        switch guestType {
            
        case .FreeChild:
            
            guard let dob = dateOfbirth else { throw Error.MissingDateOfBirth }
            let convertedDate = try DateFormatter.formatDateFromString(dob)
            self.dateOfBirth = convertedDate
            
            if childIsYoungerThanFive(convertedDate) == true {
                
                self.guestType = .FreeChild
                print("child is younger than five so is a free child!")
                
            }else {
                
                self.guestType = .Classic
            }
            
        default: self.guestType = guestType
        }
    }
}