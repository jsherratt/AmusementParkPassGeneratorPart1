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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create a manager
        do {
            let manager = try Manager(firstName: "", lastName: "", streetAdress: "", city: "", state: "", zipCode: 0, socialSecurityNumber: 1, dateOfBirth: nil, employeeType: .GeneralManager)
            
        }catch {
            print(error)
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

