//
//  Manager.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Joe Sherratt on 04/07/2016.
//  Copyright © 2016 BlueFlameApps. All rights reserved.
//

import Foundation

//-----------------------
//MARK: Protocols
//-----------------------

//Protocol that an employee has to conform to
protocol ManagerType{
    
    var firstName: String { get }
    var lastName: String { get }
    var streetAdress: String { get }
    var city: String { get }
    var state: String { get }
    var zipCode: Int { get }
    var socialSecurityNumber: Int { get }
    var dateOfBirth: NSDate { get }
    var employeeType: Managers { get }
}

//-----------------------
//MARK: Enums
//-----------------------

//Different type of hourly employees
enum Managers {
    
    case SeniorManager
    case GeneralManager
    case ShiftManager
}

//-----------------------
//MARK: Structs
//-----------------------
struct Manager: ManagerType {
    
    var firstName: String
    var lastName: String
    var streetAdress: String
    var city: String
    var state: String
    var zipCode: Int
    var socialSecurityNumber: Int
    var dateOfBirth: NSDate
    var employeeType: Managers
    
    init(firstName: String?, lastName: String?, streetAdress: String?, city: String?, state: String?, zipCode: Int?, socialSecurityNumber: Int?, dateOfBirth: NSDate?, employeeType: Managers?) throws {
        
        guard let firstOfName = firstName, let lastOfName = lastName else { throw Error.MissingName }
        
        guard let street = streetAdress, let city = city, let state = state, let zipCode = zipCode else { throw Error.MissingAdress }
        
        guard let ssn = socialSecurityNumber else { throw Error.MissingSocialSecurityNumber }
        
        guard let dob = dateOfBirth else { throw Error.MissingDateOfBirth }
        
        guard let employee = employeeType else { throw Error.MissingType}
        
        self.firstName = firstOfName
        self.lastName = lastOfName
        self.streetAdress = street
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.socialSecurityNumber = ssn
        self.dateOfBirth = dob
        self.employeeType = employee
    }
}