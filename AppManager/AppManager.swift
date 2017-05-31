//
//  TAppManager.swift
//  Starateli
//
//  Created by Virpik on 30/05/2017.
//  Copyright © 2017 Sybis. All rights reserved.
//

import Foundation

class AppManager {
    static let shaared: AppManager = AppManager()
    
    private(set) var appRunOption: AppRunOption
    private(set) var appRunOptions: [AppRunOption]
    
    private(set) var isFirstRun: Bool = false
   
    var numberOfRun: Int {
        return self.appRunOptions.count
    }
    
    var service: AppManagerService?
    
    
    private init() {
        self.appRunOption = AppRunOption()
        self.appRunOptions = []
    }
    
    func didFinishLaunch() {
        self.appRunOptions = self.service?.appRunOptions.sorted(by: {
            $0.launchDate > $1.launchDate
        }) ?? []
        
        self.isFirstRun = false
        
        if self.appRunOptions.count == 0 {
            self.isFirstRun = true
        }
        
        let date = Date()
        
        let bundleInfo = AppBundleInfo()
        
        let version = bundleInfo.bundleVersion ?? ""
        
        var appRunOption = AppRunOption()
        
        appRunOption.launchDate = date
        appRunOption.appVersion = version
        
        self.appRunOption = appRunOption
        
        self.service?.save(appRunOption: appRunOption)
        
        self.appRunOptions.append(self.appRunOption)
    }
    
    func printDebug() {
        print("================ AppManager ================")
        print("isFirstRun: ", self.isFirstRun)
        print("numberOfRun: ", self.numberOfRun)
        print(" -- current run info -- ")
        print("    date: ", self.appRunOption.launchDate)
        print("    version: ", self.appRunOption.appVersion)
        print("============================================")
        
    }
}
