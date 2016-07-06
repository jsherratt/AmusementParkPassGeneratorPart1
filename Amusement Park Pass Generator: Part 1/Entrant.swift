//
//  Entrant.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Joe Sherratt on 04/07/2016.
//  Copyright © 2016 BlueFlameApps. All rights reserved.
//

import Foundation

protocol Entrant {
    
    var pass: Pass? { get set }
    func swipePass(forArea area: AreaAccess) throws
    func swipePass(forRide ride: RideAccess) throws
    func swipePass(forDiscount discount: DiscountAccess) throws
}

extension Entrant {
    
    func swipePass(forArea area: AreaAccess) throws {
        
        guard let pass = pass else { throw Error.MissingPass }
        
        let kioskControl = KioskControl()
        var sound = Sound()
        
        if kioskControl.validateAreaAccess(forPass: pass, area: area) == true {

            print("You have been GRANTED access to: \(area)")
            sound.playSound(withSound: .AccessGranted)
            checkForGuestBirthday()
            
        }else {
            
            print("You have been DENIED access to: \(area)")
            sound.playSound(withSound: .AccessDenied)
            throw Error.DeniedAccess
        }
    }
    
    func swipePass(forRide ride: RideAccess) throws {
        
        guard let pass = pass else { throw Error.MissingPass }
        
        let kioskControl = KioskControl()
        var sound = Sound()
        
        if kioskControl.validateRideAccess(forPass: pass, ride: ride) == true {
            
            print("Success! you have been GRANTED access to: \(ride)")
            sound.playSound(withSound: .AccessGranted)
            checkForGuestBirthday()
            
        }else {
            
            print("You have been DENIED access to: \(ride)")
            sound.playSound(withSound: .AccessDenied)
            throw Error.DeniedAccess
        }
    }
    
    func swipePass(forDiscount discount: DiscountAccess) throws {
        
        guard let pass = pass else { throw Error.MissingPass }
        
        let kioskControl = KioskControl()
        var sound = Sound()
        
        if kioskControl.validateDiscountAccess(forPass: pass, discount: discount) == true {
            
            print("You have been GRANTED access to: \(discount)")
            sound.playSound(withSound: .AccessGranted)
            checkForGuestBirthday()
            
        }else {
            
            print("You have been DENIED access to: \(discount)")
            sound.playSound(withSound: .AccessDenied)
            throw Error.DeniedAccess
        }
    }
    
    func checkBirthday(withBirthday birthday: NSDate) {
        
        let calendar = NSCalendar.currentCalendar()
        let todayComponents = calendar.components([.Month, .Day], fromDate: NSDate())
        let birthdayComponents = calendar.components([.Month, .Day], fromDate: birthday)
        
        if todayComponents.month == birthdayComponents.month && todayComponents.day == birthdayComponents.day {
            print("Happy Birthday!")
        }else {
            print("Not your birthday")
        }
    }
    
    func checkForGuestBirthday() {
        
        switch self {
            
        case let guest as Guest:
            
            if let birthday: NSDate = guest.dateOfBirth {
                
                checkBirthday(withBirthday: birthday)
            }
            
        case let employee as Employee:
            
            if let birthday: NSDate = employee.dateOfBirth {
                
                checkBirthday(withBirthday: birthday)
            }
            
        case let manager as Manager:
            
            if let birthday: NSDate = manager.dateOfBirth {
                
                checkBirthday(withBirthday: birthday)
            }
        default: break
        }
    }
}

