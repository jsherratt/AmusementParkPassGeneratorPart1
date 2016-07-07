//
//  Errors.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Joe Sherratt on 04/07/2016.
//  Copyright © 2016 BlueFlameApps. All rights reserved.
//

import Foundation

//-----------------------
//MARK: Enums
//-----------------------

//Park errors that could occur
enum Error: ErrorType {
    
    case MissingName
    case MissingAddress
    case MissingSocialSecurityNumber
    case MissingDateOfBirth
    case MissingType
    case MissingPass
    case DeniedAccess
    case MissingSound
    case IncorrectDateFormat
}