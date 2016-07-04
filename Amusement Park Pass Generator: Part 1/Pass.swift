//
//  Pass.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Joe Sherratt on 04/07/2016.
//  Copyright © 2016 BlueFlameApps. All rights reserved.
//

import UIKit

//-----------------------
//MARK: Protocols
//-----------------------
protocol ParkPassType {
    
    var image: UIImage? { get }
    var name: String? { get }
    var type: String? { get }
    var areaAccess: [AreaAccess] { get }
    var rideAccess: [RideAccess] { get }
}

//-----------------------
//MARK: Enums
//-----------------------
enum PassType: String {
    
    case ClassicGuestPass = "Classic Guest Pass"
    case ChildGuestPass = "Child Guest Pass"
    case VIPGuestPass = "VIP Guest Pass"
    case FoodServicePass = "Food Services Pass"
    case RideServicePass = "Ride Services Pass"
    case MaintenancePass = "Maintenance Services Pass"
    case SeniorManagerPass = "Senior Manager Pass"
    case GeneralManagerPass = "General Manager Pass"
    case ShiftManagerPass = "Shift Manager Pass"
}

enum AreaAccess {
    
    case AmusementAreas
    case KitchenAreas
    case RideControlAreas
    case MaintenanceAreas
    case OfficeAreas
    
    static func validateAccessForEntrant(entrant: Entrant) -> [AreaAccess] {
        
        var access = [AreaAccess]()
        
        switch entrant {
            
        case is Guest: access = [.AmusementAreas]
            
        case let employee as Employee:
            
            switch employee.employeeType {
                
            case .FoodServices: access = [.AmusementAreas, .KitchenAreas]
                
            case .RideServices: access = [.AmusementAreas, .RideControlAreas]
                
            case .Maintenance: access = [.AmusementAreas, .KitchenAreas, .RideControlAreas, .MaintenanceAreas]
                
            }
            
        case is Manager: access = [.AmusementAreas, .KitchenAreas, .RideControlAreas, .MaintenanceAreas, .OfficeAreas]
            
        default: break
            
        }
        return access
    }
}

enum RideAccess {
    
    case AccessAllRides
    case SkipAllRideLines
    
    static func validateAccessForEntrant(entrant: Entrant) -> [RideAccess] {
        
        var access = [RideAccess]()
        
        switch entrant {
            
        case let guest as Guest:
            
            switch guest.guestType{
                
            case .Classic, .FreeChild: access = [.AccessAllRides]
            case .VIP: access = [.AccessAllRides, .SkipAllRideLines]
                
            }
            
        case is Employee: access = [.AccessAllRides]
            
        case is Manager: access = [.AccessAllRides]
            
        default: break
            
        }
        return access
    }
}

//-----------------------
//MARK: Structs
//-----------------------
struct Pass: ParkPassType {
    
    var image: UIImage?
    var name: String?
    var type: String?
    var areaAccess: [AreaAccess]
    var rideAccess: [RideAccess]
    
    init(entrant: Entrant) {
        
        switch entrant {
            
        case let guest as Guest:
            
            switch guest.guestType {
                
            case .Classic: self.type = PassType.ClassicGuestPass.rawValue
                
            case .FreeChild: self.type = PassType.ChildGuestPass.rawValue
                
            case .VIP: self.type = PassType.VIPGuestPass.rawValue
                
            }
            
        case let employee as Employee:
            
            switch employee.employeeType {
                
            case .FoodServices: self.type = PassType.FoodServicePass.rawValue
                
            case .RideServices: self.type = PassType.RideServicePass.rawValue
                
            case .Maintenance: self.type = PassType.MaintenancePass.rawValue
                
            }
        
        case let manager as Manager:
            
            switch manager.managerType {
                
            case .SeniorManager: self.type = PassType.SeniorManagerPass.rawValue
                
            case .GeneralManager: self.type = PassType.GeneralManagerPass.rawValue
                
            case .ShiftManager: self.type = PassType.ShiftManagerPass.rawValue
                
            }
            
        default: break
            
        }
        
        self.areaAccess = AreaAccess.validateAccessForEntrant(entrant)
        self.rideAccess = RideAccess.validateAccessForEntrant(entrant)
    }
}



