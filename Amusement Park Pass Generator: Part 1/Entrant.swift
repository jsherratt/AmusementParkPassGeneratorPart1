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
    func swipePass(forRide area: AreaAccess) throws
    
}

extension Entrant {
    
    func swipePass(forArea area: AreaAccess) throws {
        
        guard let pass = pass else { throw Error.MissingPass }
        
        let kioskControl = KioskControl()
        
        if kioskControl.validateAreaAccessForPass(pass, area: area) == true {
            
            print("Access Granted to: \(area)")
        }
    }
    
    func swipePass(forRide area: AreaAccess) throws {
        
        guard let pass = pass else { throw Error.MissingPass }
        
        let kioskControl = KioskControl()
        
        if kioskControl.validateRideAccessForPass(pass, ride: area) {
            
            print("Access Granted to: \(area)")
        }
    }
}

