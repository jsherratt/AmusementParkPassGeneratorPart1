//
//  Guest.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Joe Sherratt on 04/07/2016.
//  Copyright © 2016 BlueFlameApps. All rights reserved.
//

import Foundation

//-----------------------
//MARK: Enums
//-----------------------

//Different types of guests
enum Guests {
    
    case Classic
    case VIP
    case FreeChild
}

struct Guest: Entrant {
    
    var pass: Pass?
    var guestType: Guests
    var dateOfBirth: NSDate?
    
    init(dateOfbirth: String?, guestType: Guests) throws {
        
        switch guestType {
            
        case .FreeChild:
            
            guard let dob = dateOfbirth else { throw Error.MissingDateOfBirth }
            
            self.dateOfBirth = try DateFormatter.formatDateFromString(dob)
            
            self.guestType = .FreeChild
            
            //TODO: check if child is younger than 5 years old
            
        default: self.guestType = guestType
        }
    }
}