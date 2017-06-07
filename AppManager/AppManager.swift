//
//  TAppManager.swift
//  Starateli
//
//  Created by Virpik on 30/05/2017.
//  Copyright © 2017 Sybis. All rights reserved.
//

import Foundation

class AppManager {
    static let shared: AppManager = AppManager()
    
    private(set) var appRunOption: AppRunOption
    private(set) var appRunOptions: [AppRunOption]
    
    private(set) var isFirstRun: Bool = false
    
    var isFirstRunCurrentVersion: Bool {
        return self.countRunCurrentVersion == 1
    }
    
    var countRunCurrentVersion: Int {
        guard let appVersion = self.appRunOption.appVersion else {
            return 0
        }
        
        return self.countRunSpecial(version: appVersion)
    }
    
    var numberOfRun: Int {
        return self.appRunOptions.count
    }
    
    var service: AppManagerService?
    
    var appId: String {
        var appid: LocalItem<String> = LocalItem(key: "T_app_id")
        
        if let value = appid.value {
            return value
        }
        
        appid.value = UIDevice.current.identifierForVendor?.uuidString
        
        return appid.value!
    }
    
    private init() {
        self.appRunOption = AppRunOption()
        self.appRunOptions = []
    }
    
    func countRunSpecial(version: String) -> Int {
        return self.appRunOptions.filter({ $0.appVersion == version }).count
    }
    
    func didFinishLaunch() {
        self.appRunOptions = self.service?.appRunOptions.sorted(by: {
            $0.launchDate < $1.launchDate
        }) ?? []
        
        self.isFirstRun = false
        
        if self.appRunOptions.count == 0 {
            self.isFirstRun = true
        }
        
        let date = Date()
        
        let bundleInfo = AppBundleInfo()
        
        let buildVersion = bundleInfo.bundleVersion ?? ""
        let appVersion = bundleInfo.bundleVersionsStringShort ?? ""
        
        var appRunOption = AppRunOption()
        
        appRunOption.launchDate = date
        appRunOption.appVersion = appVersion
        appRunOption.buildVersion = buildVersion
        
        self.appRunOption = appRunOption
        
        self.service?.save(appRunOption: appRunOption)
        
        self.appRunOptions.append(self.appRunOption)
    }
    
    func printDebug() {
        print("================ AppManager ================")
        print("isFirstRun: ", self.isFirstRun)
        print("numberOfRun: ", self.numberOfRun)
        print(" -- current run info -- ")
        print("    date: ", self.appRunOption.launchDate.string(format: "dd/MM/yyyy hh:mm"))
        print("    bundle version: ", self.appRunOption.buildVersion)
        print("    version: ", self.appRunOption.appVersion)
        print("============================================")
    }
}
