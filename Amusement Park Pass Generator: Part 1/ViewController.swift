//
//  ViewController.swift
//  Amusement Park Pass Generator: Part 1
//
//  Created by Joe Sherratt on 02/07/2016.
//  Copyright © 2016 BlueFlameApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //-----------------------
    //MARK: Variables
    //-----------------------
    var kioskControl = KioskControl()
    var person: Entrant?

    //-----------------------
    //MARK: View
    //-----------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create a manager
        /*
        do {
            let manager = try Manager(firstName: "", lastName: "", streetAdress: "", city: "", state: "", zipCode: 0, socialSecurityNumber: 1, dateOfBirth: "07/06/16", managerType: .GeneralManager)
            person = manager
            print(manager.dateOfBirth)
            
        }catch {
            print(error)
        }
        */
        
        //Create free child
        
        do {
            let freeChildGuest = try Guest(dateOfbirth: "07/06/16", guestType: .FreeChild)
            person = freeChildGuest
            print(freeChildGuest.dateOfBirth!)
            
        }catch {
            print(error)
        }
 
        
        //Create pass and check if person can enter an area
        if var person = self.person {
            
            let pass = self.kioskControl.createPass(forEntrant: person)
            person.pass = pass
            
            do {
            
                try person.swipePass(forArea: .AmusementAreas)
                
            } catch Error.MissingPass {
                print("You do not have a pass. Please get one!")
                
            } catch Error.DeniedAccess {
                print("You do not have access to this area")
                
            }catch {
                print(error)
            }
        }
    }
    
    //-----------------------
    //MARK: Extra
    //-----------------------
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

