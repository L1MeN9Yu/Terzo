//
// Created by Mengyu Li on 2018/4/15.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

import Foundation
import UIKit

extension UIDevice {
    public class func systemMajorVersion() -> UInt {
        let os = ProcessInfo().operatingSystemVersion
        switch (os.majorVersion, os.minorVersion, os.patchVersion) {
        case (12, _, _):
            return 12
        case (11, _, _):
            return 11
        case (10, _, _):
            return 10
        case (9, _, _):
            return 9
        case (8, _, _):
            return 8
        default:
            return 7
        }
    }

    public func systemMajorVersion() -> UInt {
        return UIDevice.systemMajorVersion()
    }
}