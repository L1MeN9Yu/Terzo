//
// Created by Mengyu Li on 2018/4/15.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

import Foundation
import UIKit
import LocalAuthentication

extension UIDevice {
    public class func deviceSupportFaceID() -> Bool {
        if (UIDevice.systemMajorVersion() >= 11) {
            let context = LAContext.init()
            var error: NSError?
            if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                if #available(iOS 11.0, *) {
                    if (context.biometryType == .faceID) {
                        return true
                    }
                } else {
                    return false
                }
            }
        }
        return false
    }

    public func deviceSupportFaceID() -> Bool {
        return UIDevice.deviceSupportFaceID()
    }

    public class func deviceSupportTouchID() -> Bool {
        let context = LAContext.init()
        var error: NSError?
        if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            if #available(iOS 11.0, *) {
                if (context.biometryType == .touchID) {
                    return true
                } else {
                    return false
                }
            } else {
                return true
            }
        }
        return false
    }

    public func deviceSupportTouchID() -> Bool {
        return UIDevice.deviceSupportTouchID()
    }

    public class func deviceSupportSecureEnclave() -> Bool {
        var isSupported: Bool = true
        let deviceVersion = UIDevice.deviceVersion()
        if (UIDevice.systemMajorVersion() >= 9) {
            switch deviceVersion {
            case .iPhone4:
                isSupported = false
                break
            case .iPhone4S:
                isSupported = false
                break
            case .iPhone5:
                isSupported = false
                break
            case .iPhone5C:
                isSupported = false
                break
            case .iPad1:
                isSupported = false
                break
            case .iPad2:
                isSupported = false
                break
            case .iPad3:
                isSupported = false
                break
            case .iPad4:
                isSupported = false
                break
            case .iPadAir:
                isSupported = false
                break
            case .iPadMini:
                isSupported = false
                break
            case .iPadMini2:
                isSupported = false
                break
            case .iPodTouch1Gen:
                isSupported = false
                break
            case .iPodTouch2Gen:
                isSupported = false
                break
            case .iPodTouch3Gen:
                isSupported = false
                break
            case .iPodTouch4Gen:
                isSupported = false
                break
            case .iPodTouch5Gen:
                isSupported = false
                break
            case .iPodTouch6Gen:
                isSupported = false
                break
            case .Simulator:
                isSupported = false
                break
            case .UnknownDevice:
                isSupported = false
                break
            default:
                isSupported = true
                break
            }
        } else {
            isSupported = false
        }
        return isSupported
    }

    public func deviceSupportSecureEnclave() -> Bool {
        return UIDevice.deviceSupportSecureEnclave()
    }
}