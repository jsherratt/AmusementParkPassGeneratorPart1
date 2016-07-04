//
//  KioskControl.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Joe Sherratt on 04/07/2016.
//  Copyright © 2016 BlueFlameApps. All rights reserved.
//

import Foundation

protocol Kiosk {
    
    func createPassForEntrant(entrant: Entrant) -> Pass
    func validateAreaAccessForPass(pass: Pass, area areas: AreaAccess) -> Bool
    func validateRideAccessForPass(pass: Pass, ride area: AreaAccess) -> Bool
}

struct KioskControl: Kiosk {
    
    func createPassForEntrant(entrant: Entrant) -> Pass {
        
        return Pass(entrant: entrant)
    }
    
    func validateAreaAccessForPass(pass: Pass, area: AreaAccess) -> Bool {
        
        for access in pass.areaAccess {
            
            if access == area {
                
                return true
            }
        }
        return false
    }
    
    func validateRideAccessForPass(pass: Pass, ride area: AreaAccess) -> Bool {
        
        for access in pass.areaAccess {
            
            if access == area {
                
                return true
            }
        }
        return false
    }
}
