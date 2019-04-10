//
// Created by Mengyu Li on 2018/4/10.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

import Foundation
import UIKit

let deviceNamesByCode = [
    "iPhone3,1": UIDevice.DeviceVersion.iPhone4.rawValue,
    "iPhone3,2": UIDevice.DeviceVersion.iPhone4.rawValue,
    "iPhone3,3": UIDevice.DeviceVersion.iPhone4.rawValue,
    "iPhone4,1": UIDevice.DeviceVersion.iPhone4S.rawValue,
    "iPhone4,2": UIDevice.DeviceVersion.iPhone4S.rawValue,
    "iPhone4,3": UIDevice.DeviceVersion.iPhone4S.rawValue,
    "iPhone5,1": UIDevice.DeviceVersion.iPhone5.rawValue,
    "iPhone5,2": UIDevice.DeviceVersion.iPhone5.rawValue,
    "iPhone5,3": UIDevice.DeviceVersion.iPhone5C.rawValue,
    "iPhone5,4": UIDevice.DeviceVersion.iPhone5C.rawValue,
    "iPhone6,1": UIDevice.DeviceVersion.iPhone5S.rawValue,
    "iPhone6,2": UIDevice.DeviceVersion.iPhone5S.rawValue,
    "iPhone7,2": UIDevice.DeviceVersion.iPhone6.rawValue,
    "iPhone7,1": UIDevice.DeviceVersion.iPhone6Plus.rawValue,
    "iPhone8,1": UIDevice.DeviceVersion.iPhone6S.rawValue,
    "iPhone8,2": UIDevice.DeviceVersion.iPhone6SPlus.rawValue,
    "iPhone8,4": UIDevice.DeviceVersion.iPhoneSE.rawValue,
    "iPhone9,1": UIDevice.DeviceVersion.iPhone7.rawValue,
    "iPhone9,3": UIDevice.DeviceVersion.iPhone7.rawValue,
    "iPhone9,2": UIDevice.DeviceVersion.iPhone7Plus.rawValue,
    "iPhone9,4": UIDevice.DeviceVersion.iPhone7Plus.rawValue,
    "iPhone10,1": UIDevice.DeviceVersion.iPhone8.rawValue,
    "iPhone10,4": UIDevice.DeviceVersion.iPhone8.rawValue,
    "iPhone10,2": UIDevice.DeviceVersion.iPhone8Plus.rawValue,
    "iPhone10,5": UIDevice.DeviceVersion.iPhone8Plus.rawValue,
    "iPhone10,3": UIDevice.DeviceVersion.iPhoneX.rawValue,
    "iPhone10,6": UIDevice.DeviceVersion.iPhoneX.rawValue,
    "iPhone11,8": UIDevice.DeviceVersion.iPhoneXR.rawValue,
    "iPhone11,2": UIDevice.DeviceVersion.iPhoneXS.rawValue,
    "iPhone11,4": UIDevice.DeviceVersion.iPhoneXSMax.rawValue,
    "iPhone11,6": UIDevice.DeviceVersion.iPhoneXSMax.rawValue,
    "i386": UIDevice.DeviceVersion.Simulator.rawValue,
    "x86_64": UIDevice.DeviceVersion.Simulator.rawValue,
    "iPad1,1": UIDevice.DeviceVersion.iPad1.rawValue,
    "iPad2,1": UIDevice.DeviceVersion.iPad2.rawValue,
    "iPad2,2": UIDevice.DeviceVersion.iPad2.rawValue,
    "iPad2,3": UIDevice.DeviceVersion.iPad2.rawValue,
    "iPad2,4": UIDevice.DeviceVersion.iPad2.rawValue,
    "iPad2,5": UIDevice.DeviceVersion.iPadMini.rawValue,
    "iPad2,6": UIDevice.DeviceVersion.iPadMini.rawValue,
    "iPad2,7": UIDevice.DeviceVersion.iPadMini.rawValue,
    "iPad3,1": UIDevice.DeviceVersion.iPad3.rawValue,
    "iPad3,2": UIDevice.DeviceVersion.iPad3.rawValue,
    "iPad3,3": UIDevice.DeviceVersion.iPad3.rawValue,
    "iPad3,4": UIDevice.DeviceVersion.iPad4.rawValue,
    "iPad3,5": UIDevice.DeviceVersion.iPad4.rawValue,
    "iPad3,6": UIDevice.DeviceVersion.iPad4.rawValue,
    "iPad4,1": UIDevice.DeviceVersion.iPadAir.rawValue,
    "iPad4,2": UIDevice.DeviceVersion.iPadAir.rawValue,
    "iPad4,3": UIDevice.DeviceVersion.iPadAir.rawValue,
    "iPad4,4": UIDevice.DeviceVersion.iPadMini2.rawValue,
    "iPad4,5": UIDevice.DeviceVersion.iPadMini2.rawValue,
    "iPad4,6": UIDevice.DeviceVersion.iPadMini2.rawValue,
    "iPad4,7": UIDevice.DeviceVersion.iPadMini3.rawValue,
    "iPad4,8": UIDevice.DeviceVersion.iPadMini3.rawValue,
    "iPad4,9": UIDevice.DeviceVersion.iPadMini3.rawValue,
    "iPad5,1": UIDevice.DeviceVersion.iPadMini4.rawValue,
    "iPad5,2": UIDevice.DeviceVersion.iPadMini4.rawValue,
    "iPad5,3": UIDevice.DeviceVersion.iPadAir2.rawValue,
    "iPad5,4": UIDevice.DeviceVersion.iPadAir2.rawValue,
    "iPad6,3": UIDevice.DeviceVersion.iPadPro9Dot7Inch.rawValue,
    "iPad6,4": UIDevice.DeviceVersion.iPadPro9Dot7Inch.rawValue,
    "iPad6,7": UIDevice.DeviceVersion.iPadPro12Dot9Inch.rawValue,
    "iPad6,8": UIDevice.DeviceVersion.iPadPro12Dot9Inch.rawValue,
    "iPad6,11": UIDevice.DeviceVersion.iPad5.rawValue,
    "iPad6,12": UIDevice.DeviceVersion.iPad5.rawValue,
    "iPad7,1": UIDevice.DeviceVersion.iPadPro12Dot9Inch2Gen.rawValue,
    "iPad7,2": UIDevice.DeviceVersion.iPadPro12Dot9Inch2Gen.rawValue,
    "iPad7,3": UIDevice.DeviceVersion.iPadPro10Dot5Inch.rawValue,
    "iPad7,4": UIDevice.DeviceVersion.iPadPro10Dot5Inch.rawValue,
    "iPad7,5": UIDevice.DeviceVersion.iPad62018.rawValue,
    "iPad7,6": UIDevice.DeviceVersion.iPad62018.rawValue,
    "iPod1,1": UIDevice.DeviceVersion.iPodTouch1Gen.rawValue,
    "iPod2,1": UIDevice.DeviceVersion.iPodTouch2Gen.rawValue,
    "iPod3,1": UIDevice.DeviceVersion.iPodTouch4Gen.rawValue,
    "iPod5,1": UIDevice.DeviceVersion.iPodTouch5Gen.rawValue,
    "iPod7,1": UIDevice.DeviceVersion.iPodTouch6Gen.rawValue]

extension UIDevice {
    // 是否为iPad
    public static var isiPad: Bool {
        return UI_USER_INTERFACE_IDIOM() == .pad
    }

    public class func deviceVersion() -> DeviceVersion {
        var systemInfo = utsname()
        uname(&systemInfo)

        let modelCode = withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {
                ptr in
                String.init(validatingUTF8: ptr)
            }
        }

        let version: DeviceVersion = DeviceVersion(rawValue: deviceNamesByCode[modelCode!]!)!

        return version
    }

    public func deviceVersion() -> DeviceVersion {
        return UIDevice.deviceVersion()
    }

    public class func resolutionSize() -> DeviceSize {
        let screenHeight: CGFloat = UIScreen.main.nativeBounds.size.height

        if screenHeight == 480 || screenHeight == 960 {
            return .Screen3Dot5inch
        } else if screenHeight == 1136 {
            return .Screen4inch;
        } else if screenHeight == 1334 {
            return .Screen4Dot7inch;
        } else if screenHeight == 2208 {
            return .Screen5Dot5inch;
        } else if screenHeight == 2436 {
            return .Screen5Dot8inch;
        } else if screenHeight == 1792 {
            return .Screen6Dot1inch;
        } else if screenHeight == 2688 {
            return .Screen6Dot5inch;
        }
        return .UnknownSize;
    }

    public func resolutionSize() -> DeviceSize {
        return UIDevice.resolutionSize()
    }

    public class func deviceSize() -> DeviceSize {
        var deviceSize: DeviceSize = UIDevice.resolutionSize()
        if UIDevice.isZoomed() {
            if deviceSize == .Screen4inch {
                deviceSize = .Screen4Dot7inch
            } else if deviceSize == .Screen4Dot7inch {
                deviceSize = .Screen5Dot5inch
            }
        }
        return deviceSize
    }

    public func deviceSize() -> DeviceSize {
        return UIDevice.deviceSize()
    }

    public class func deviceSizeName(_ deviceSize: DeviceSize) -> String? {

        return [DeviceSize.UnknownSize: "Unknown Size",
                DeviceSize.Screen3Dot5inch: "3.5 inch",
                DeviceSize.Screen4inch: "4 inch",
                DeviceSize.Screen4Dot7inch: "4.7 inch",
                DeviceSize.Screen5Dot5inch: "5.5 inch",
                DeviceSize.Screen5Dot8inch: "5.8 inch",
                DeviceSize.Screen6Dot1inch: "6.1 inch",
                DeviceSize.Screen6Dot5inch: "6.5 inch", ][deviceSize]
    }

    public func deviceSizeName(_ deviceSize: DeviceSize) -> String? {
        return UIDevice.deviceSizeName(deviceSize)
    }

    public class func deviceNameString() -> String? {
        return UIDevice.deviceName(UIDevice.deviceVersion())
    }

    public func deviceNameString() -> String? {
        return UIDevice.deviceNameString()
    }

    public class func deviceName(_ deviceVersion: DeviceVersion) -> String? {
        return [DeviceVersion.iPhone4: "iPhone 4",
                DeviceVersion.iPhone4S: "iPhone 4S",
                DeviceVersion.iPhone5: "iPhone 5",
                DeviceVersion.iPhone5C: "iPhone 5C",
                DeviceVersion.iPhone5S: "iPhone 5S",
                DeviceVersion.iPhone6: "iPhone 6",
                DeviceVersion.iPhone6Plus: "iPhone 6 Plus",
                DeviceVersion.iPhone6S: "iPhone 6S",
                DeviceVersion.iPhone6SPlus: "iPhone 6S Plus",
                DeviceVersion.iPhone7: "iPhone 7",
                DeviceVersion.iPhone7Plus: "iPhone 7 Plus",
                DeviceVersion.iPhone8: "iPhone 8",
                DeviceVersion.iPhone8Plus: "iPhone 8 Plus",
                DeviceVersion.iPhoneX: "iPhone X",
                DeviceVersion.iPhoneSE: "iPhone SE",
                DeviceVersion.iPhoneXS: "iPhone XS",
                DeviceVersion.iPhoneXR: "iPhone XR",
                DeviceVersion.iPhoneXSMax: "iPhone XS Max",
                DeviceVersion.iPad1: "iPad 1",
                DeviceVersion.iPad2: "iPad 2",
                DeviceVersion.iPadMini: "iPad Mini",
                DeviceVersion.iPad3: "iPad 3",
                DeviceVersion.iPad4: "iPad 4",
                DeviceVersion.iPadAir: "iPad Air",
                DeviceVersion.iPadMini2: "iPad Mini 2",
                DeviceVersion.iPadAir2: "iPad Air 2",
                DeviceVersion.iPadMini3: "iPad Mini 3",
                DeviceVersion.iPadMini4: "iPad Mini 4",
                DeviceVersion.iPadPro9Dot7Inch: "iPad Pro 9.7 inch",
                DeviceVersion.iPadPro12Dot9Inch: "iPad Pro 12.9 inch",
                DeviceVersion.iPad5: "iPad 5",
                DeviceVersion.iPadPro10Dot5Inch: "iPad Pro 10.5 inch",
                DeviceVersion.iPadPro12Dot9Inch2Gen: "iPad Pro 12.9 inch",
                DeviceVersion.iPad62018: "iPad 6 2018",
                DeviceVersion.iPodTouch1Gen: "iPod Touch 1st Gen",
                DeviceVersion.iPodTouch2Gen: "iPod Touch 2nd Gen",
                DeviceVersion.iPodTouch3Gen: "iPod Touch 3rd Gen",
                DeviceVersion.iPodTouch4Gen: "iPod Touch 4th Gen",
                DeviceVersion.iPodTouch5Gen: "iPod Touch 5th Gen",
                DeviceVersion.iPodTouch6Gen: "iPod Touch 6th Gen",
                DeviceVersion.Simulator: "Simulator",
                DeviceVersion.UnknownDevice: "Unknown Device"][deviceVersion]
    }

    public func deviceName(_ deviceVersion: DeviceVersion) -> String? {
        return UIDevice.deviceName(deviceVersion)
    }

    public class func isZoomed() -> Bool {
        if UIDevice.resolutionSize() == .Screen4inch && UIScreen.main.nativeScale > 2 {
            return true
        } else if UIDevice.resolutionSize() == .Screen4Dot7inch && UIScreen.main.scale == 3 {
            return true
        }
        return false
    }

    public func isZoomed() -> Bool {
        return UIDevice.isZoomed()
    }

    public enum DeviceVersion: Int {
        case UnknownDevice = 0
        case Simulator = 1
        case iPhone4 = 3
        case iPhone4S = 4
        case iPhone5 = 5
        case iPhone5C = 6
        case iPhone5S = 7
        case iPhone6 = 8
        case iPhone6Plus = 9
        case iPhone6S = 10
        case iPhone6SPlus = 11
        case iPhone7 = 12
        case iPhone7Plus = 13
        case iPhone8 = 14
        case iPhone8Plus = 15
        case iPhoneX = 16
        case iPhoneSE = 17
        case iPhoneXS = 18
        case iPhoneXR = 19
        case iPhoneXSMax = 20
        case iPad1 = 21
        case iPad2 = 22
        case iPadMini = 23
        case iPad3 = 24
        case iPad4 = 25
        case iPadAir = 26
        case iPadMini2 = 27
        case iPadAir2 = 28
        case iPadMini3 = 29
        case iPadMini4 = 30
        case iPadPro12Dot9Inch = 31
        case iPadPro9Dot7Inch = 32
        case iPad5 = 33
        case iPadPro12Dot9Inch2Gen = 34
        case iPadPro10Dot5Inch = 35
        case iPad62018 = 36
        case iPodTouch1Gen = 37
        case iPodTouch2Gen = 38
        case iPodTouch3Gen = 39
        case iPodTouch4Gen = 40
        case iPodTouch5Gen = 41
        case iPodTouch6Gen = 42
    }

    public enum DeviceSize: Int {
        case UnknownSize = 0
        case Screen3Dot5inch = 1
        case Screen4inch = 2
        case Screen4Dot7inch = 3
        case Screen5Dot5inch = 4
        case Screen5Dot8inch = 5
        case Screen6Dot1inch = 6
        case Screen6Dot5inch = 7
    }
}
