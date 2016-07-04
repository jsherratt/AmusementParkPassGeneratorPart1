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
}

enum PassType: String {
    
    case ClassicGuestPass = "Classic Guest Pass"
    case ChildGuestPass = "Child Guest Pass"
    case VIPGuestPass = "VIP Guest Pass"
    case FoodServicePass = "Food Services Pass"
    case RideServicePass = "Ride Services Pass"
    case MaintenancePass = "Maintenance Services Pass"
    case ShiftManagerPass = "Shift Manager Pass"
    case GeneralManagerPass = "General Manager Pass"
    case SeniorManagerPass = "Senior Manager Pass"
}

//-----------------------
//MARK: Structs
//-----------------------
struct Pass: ParkPassType {
    
    var image: UIImage?
    var name: String?
    var type: String?
    
    
}