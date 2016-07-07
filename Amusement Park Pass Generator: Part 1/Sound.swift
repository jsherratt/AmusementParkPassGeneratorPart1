//
//  Sound.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Joe Sherratt on 05/07/2016.
//  Copyright © 2016 BlueFlameApps. All rights reserved.
//

import Foundation
import AudioToolbox


//-----------------------
//MARK: Structs
//-----------------------
struct Sound {
    
    enum Sounds:String {
        
        case AccessGranted
        case AccessDenied
    }
    
    private enum SoundType: String {
        
        case wav
    }
    
    //-----------------------
    //MARK: Variables
    //-----------------------
    private var accessGrantedSound: SystemSoundID = 0
    private var accessDeniedSound: SystemSoundID = 1
    
    mutating func playSound(withSound sound: Sounds) {
        
        switch sound {
            
        case .AccessGranted:
            
            if let pathToSound = NSBundle.mainBundle().pathForResource(Sounds.AccessGranted.rawValue, ofType: SoundType.wav.rawValue) {
            
                let url = NSURL(fileURLWithPath: pathToSound)
                AudioServicesCreateSystemSoundID(url, &accessGrantedSound)
                AudioServicesPlayAlertSound(accessGrantedSound)
            }
            
        case .AccessDenied:
            
            if let pathToSound = NSBundle.mainBundle().pathForResource(Sounds.AccessDenied.rawValue, ofType: SoundType.wav.rawValue) {
            
                let url = NSURL(fileURLWithPath: pathToSound)
                AudioServicesCreateSystemSoundID(url, &accessDeniedSound)
                AudioServicesPlayAlertSound(accessDeniedSound)
            }
        }
    }
    
    
    //Same version of the play sound function above but this one throws an error if the sound file is missing
    /*
     mutating func playSound(sound: Sounds) throws {
        
        switch sound {
            
        case .AccessGranted:
            
            guard let pathToSound = NSBundle.mainBundle().pathForResource(Sounds.AccessGranted.rawValue, ofType: "wav") else { throw Error.MissingSound }
                
            let url = NSURL(fileURLWithPath: pathToSound)
            AudioServicesCreateSystemSoundID(url, &accessGrantedSound)
            AudioServicesPlayAlertSound(accessGrantedSound)
            
            
        case .AccessDenied:
            
            guard let pathToSound = NSBundle.mainBundle().pathForResource(Sounds.AccessDenied.rawValue, ofType: "wav") else { throw Error.MissingSound }
                
            let url = NSURL(fileURLWithPath: pathToSound)
            AudioServicesCreateSystemSoundID(url, &accessDeniedSound)
            AudioServicesPlayAlertSound(accessDeniedSound)
        }
    }
    */
}