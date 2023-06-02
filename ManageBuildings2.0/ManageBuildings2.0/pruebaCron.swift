//
//  pruebaCron.swift
//  manageBuildings
//
//  Created by wrichy on 9/18/17.
//  Copyright © 2017 wrichy. All rights reserved.
//

import Foundation
import SwiftCron

class pruebaCron{
    
        
    func checar(){
           let everyDay = CronExpression(cronString: "0 0 * * 1,2,3,4,5,6,7 *")
        let dateToStartSearchOn = NSDate()
        _ = everyDay?.getNextRunDate(dateToStartSearchOn as Date)
        
           // CronJob
            print("hola")
    }
    
    
}
