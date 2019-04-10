//
//  UIApplication.Info.swift
//
//  Created by Mengyu Li on 2018/5/3.
//  Copyright © 2019 L1MeN9Yu. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    public class var documentsPath: String? { return self.shared.documentsPath }

    public class var documentsURL: URL? { return self.shared.documentsURL }

    public class var libraryPath: String? { return self.shared.libraryPath }

    public class var libraryURL: URL? { return self.shared.libraryURL }

    public class var cachesPath: String? { return self.shared.cachesPath }

    public class var cachesURL: URL? { return self.shared.cachesURL }

    public class var bundleName: String? { return self.shared.bundleName }

    public class var bundleID: String? { return self.shared.bundleID }

    ///版本号
    public class var version: String? { return self.shared.version }

    ///build号
    public class var buildVersion: String? { return self.shared.buildVersion }

    public var documentsPath: String? { return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first }

    public var documentsURL: URL? { return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last }

    public var libraryPath: String? { return NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first }

    public var libraryURL: URL? { return FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).last }

    public var cachesPath: String? { return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first }

    public var cachesURL: URL? { return FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).last }

    public var bundleName: String? {
        let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String
        return name
    }

    public var bundleID: String? {
        let id = Bundle.main.object(forInfoDictionaryKey: "CFBundleIdentifier") as? String
        return id
    }

    ///版本号
    public var version: String? {
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
        return version
    }

    ///build号
    public var buildVersion: String? {
        let buildVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
        return buildVersion
    }
}
