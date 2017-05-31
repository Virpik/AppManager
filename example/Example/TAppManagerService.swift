//
//  TAppManagerService.swift
//  Example
//
//  Created by Virpik on 31/05/2017.
//  Copyright © 2017 Virpik. All rights reserved.
//

import Foundation
import MagicalRecord

class TAppManagerService: AppManagerService {
    var appRunOptions: [AppRunOption]  {
        
        let tAppRunOptions = TAppRunOption.mr_findAll() as?  [TAppRunOption] ?? []
        
        let appRunOptions = tAppRunOptions.map({
            return AppRunOption(appVersion: $0.version, launchDate: $0.date)
        })
        
        return appRunOptions
    }
    
    func save(appRunOption: AppRunOption) {
        let tAppRunOption = TAppRunOption.mr_createEntity()!
        
        tAppRunOption.date = appRunOption.launchDate
        tAppRunOption.version = appRunOption.appVersion
        
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
    }
}
