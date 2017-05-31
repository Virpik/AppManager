//
//  AppBundleInfo.swift
//  Starateli
//
//  Created by Virpik on 30/05/2017.
//  Copyright © 2017 Sybis. All rights reserved.
//

import Foundation

struct AppBundleInfo {
    struct CFBundleKeys {
        static let cfBundleDevelopmentRegion = String(kCFBundleDevelopmentRegionKey)
        static let cfBundleExecutable = String(kCFBundleExecutableKey)
        static let cfBundleIdentifier = String(kCFBundleIdentifierKey)
        static let cfBundleName = String(kCFBundleNameKey)
        static let cfBundleVersion = String(kCFBundleVersionKey)
    }

    let localizationNativeDevelopmentRegion: String? // CFBundleDevelopmentRegion
    
    let executableFile: String? // CFBundleExecutable
    
    let bundleIdentifier: String? // CFBundleIdentifier
    
    let bundleName: String? // CFBundleName

    let bundleVersion: String? // CFBundleVersion
    
    init() {
        let bundle = Bundle.main
        let dictionary = bundle.infoDictionary ?? [:]
        
        self.localizationNativeDevelopmentRegion = dictionary[CFBundleKeys.cfBundleDevelopmentRegion] as? String
        self.executableFile = dictionary[CFBundleKeys.cfBundleExecutable] as? String
        self.bundleIdentifier = dictionary[CFBundleKeys.cfBundleIdentifier] as? String
        self.bundleName = dictionary[CFBundleKeys.cfBundleName] as? String
        self.bundleVersion = dictionary[CFBundleKeys.cfBundleVersion] as? String
    }
}
