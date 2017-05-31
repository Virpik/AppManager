//
//  AppRunOption.swift
//  Starateli
//
//  Created by Virpik on 30/05/2017.
//  Copyright © 2017 Sybis. All rights reserved.
//

import Foundation

struct AppRunOption {
    var appVersion: String!
    var launchDate: Date!

    init() {
        
    }
    
    init(appVersion: String, launchDate: Date) {
        self.appVersion = appVersion
        self.launchDate = launchDate
    }
}
