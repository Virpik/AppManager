//
//  AppManagerService.swift
//  Starateli
//
//  Created by Virpik on 30/05/2017.
//  Copyright © 2017 Sybis. All rights reserved.
//

import Foundation

protocol AppManagerService {
    var appRunOptions: [AppRunOption] { get }
    
    func save(appRunOption: AppRunOption)
}
