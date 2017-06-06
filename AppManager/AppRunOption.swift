//
//  AppRunOption.swift
//  Starateli
//
//  Created by Virpik on 30/05/2017.
//  Copyright © 2017 Sybis. All rights reserved.
//

import Foundation

struct AppRunOption {
    var buildVersion: String!
    var appVersion: String!
    var launchDate: Date!

    init() {
        
    }
    
    init(appVersion: String, buildVersion: String, launchDate: Date) {
        self.buildVersion = buildVersion
        self.appVersion = appVersion
        self.launchDate = launchDate
    }
}
