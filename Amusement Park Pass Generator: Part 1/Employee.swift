//
//  Employee.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Joe Sherratt on 04/07/2016.
//  Copyright © 2016 BlueFlameApps. All rights reserved.
//

import UIKit

//-----------------------
//MARK: Protocols
//-----------------------

//Protocol that an employee has to conform to
protocol EmployeeType: Entrant {
    
    var firstName: String { get }
    var lastName: String { get }
    var streetAddress: String { get }
    var city: String { get }
    var state: String { get }
    var zipCode: Int { get }
    var socialSecurityNumber: Int { get }
    var dateOfBirth: NSDate { get }
    var employeeType: HourlyEmployees { get }
}

//-----------------------
//MARK: Enums
//-----------------------

//Different type of hourly employees
enum HourlyEmployees {
    
    case FoodServices
    case RideServices
    case Maintenance
}

//-----------------------
//MARK: Structs
//-----------------------
struct Employee: EmployeeType {
    
    var pass: Pass?
    
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: Int
    var socialSecurityNumber: Int
    var dateOfBirth: NSDate
    var employeeType: HourlyEmployees
    
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: Int?, socialSecurityNumber: Int?, dateOfBirth: String?, employeeType: HourlyEmployees?) throws {
        
        guard let firstOfName = firstName, let lastOfName = lastName else { throw Error.MissingName }
        
        guard let street = streetAddress, let city = city, let state = state, let zipCode = zipCode else { throw Error.MissingAddress }
        
        guard let ssn = socialSecurityNumber else { throw Error.MissingSocialSecurityNumber }
        
        guard let dob = dateOfBirth else { throw Error.MissingDateOfBirth }
        
        guard let employee = employeeType else { throw Error.MissingType}
        
        self.firstName = firstOfName
        self.lastName = lastOfName
        self.streetAddress = street
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.socialSecurityNumber = ssn
        self.dateOfBirth = try DateFormatter.convertString(toDate: dob)
        self.employeeType = employee
    }
}
