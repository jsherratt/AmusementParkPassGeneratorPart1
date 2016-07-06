//
//  KioskControl.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Joe Sherratt on 04/07/2016.
//  Copyright © 2016 BlueFlameApps. All rights reserved.
//

import Foundation

protocol Kiosk {
    
    func createPass(forEntrant entrant: Entrant) -> Pass
    func validateAreaAccess(forPass pass: Pass, area areas: AreaAccess) -> Bool
    func validateRideAccess(forPass pass: Pass, ride: RideAccess) -> Bool
    func validateDiscountAccess(forPass pass: Pass, discount: DiscountAccess) -> Bool
}

struct KioskControl: Kiosk {
    
    func createPass(forEntrant entrant: Entrant) -> Pass {
        
        return Pass(entrant: entrant)
    }
    
    func validateAreaAccess(forPass pass: Pass, area: AreaAccess) -> Bool {
        
        for access in pass.areaAccess {

            if access == area {
                
                return true
            }
        }
        return false
    }
    
    func validateRideAccess(forPass pass: Pass, ride: RideAccess) -> Bool {
        
        for access in pass.rideAccess {
            
            if access == ride {
                
                return true
            }
        }
        return false
    }
    
    func validateDiscountAccess(forPass pass: Pass, discount: DiscountAccess) -> Bool {
        
        if let discountAccess = pass.discountAccess {
            
            for discountAcc in discountAccess {
                
                switch (discountAcc, discount) {
                    
                case (let .DiscountOnFood(amount: value1), let .DiscountOnFood(amount: value2)):
                    
                    if value1 == value2 {
                        return true
                    }else {
                        return false
                    }
                
                case (let .DiscoundOnMerchandise(amount: value1), let .DiscoundOnMerchandise(amount: value2)):
                    
                    if value1 == value2 {
                        return true
                    }else {
                        return false
                    }
                    
                default:break
                }
            }
        }
        
        return false
    }
}
