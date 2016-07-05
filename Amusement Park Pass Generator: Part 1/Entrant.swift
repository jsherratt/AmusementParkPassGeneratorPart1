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
        
        if kioskControl.validateAreaAccessForPass(pass, area: area) == true {
            
            print("Success! you have been granted access to: \(area)")
        }else {
            
            print("Error you have not been granted access to: \(area)")
            throw Error.DeniedAccess
        }
    }
    
    func swipePass(forRide ride: RideAccess) throws {
        
        guard let pass = pass else { throw Error.MissingPass }
        
        let kioskControl = KioskControl()
        
        if kioskControl.validateRideAccessForPass(pass, ride: ride) == true {
            
            print("Success! you have been granted access to: \(ride)")
            
        }else {
            
            print("Error you have not been granted access to: \(ride)")
            throw Error.DeniedAccess
        }
    }
    
    func swipePass(forDiscount discount: DiscountAccess) throws {
        
        guard let pass = pass else { throw Error.MissingPass }
        
        let kioskControl = KioskControl()
        
        if kioskControl.validateDiscountAccessForPass(pass, discount: discount) == true {
            
            print("Success! you have been granted access to: \(discount)")
            
        }else {
            
            print("Error you have not been granted access to: \(discount)")
            throw Error.DeniedAccess
        }
    }
}

