//
// Created by Mengyu Li on 2018/4/10.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
        self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    }

    public convenience init(rgb: UInt, a: CGFloat = 1) {
        self.init(
                red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat((rgb & 0x0000FF)) / 255.0,
                alpha: a
        )
    }

    ///  rgba 样式:"0x121212"
    public convenience init(rgba: UInt) {
        self.init(
                red: CGFloat((rgba & 0xFF000000) >> 24) / 255,
                green: CGFloat((rgba & 0x00FF0000) >> 16) / 255,
                blue: CGFloat((rgba & 0x0000FF00) >> 8) / 255,
                alpha: CGFloat((rgba & 0x000000FF)) / 255
        )
    }

    /// alpha 默认为1.0 ， hexString 样式:"#121212"
    public convenience init?(hexString: String, alpha: CGFloat = 1.0) {
        var hex = hexString

        if hex.hasPrefix("#") {
            let idx = hex.index(hex.startIndex, offsetBy: 1)
            hex = String(hex.suffix(from: idx))
        }

        guard let hexVal = Int(hex, radix: 16) else {
            self.init()
            return nil
        }

        switch hex.count {
        case 3:
            self.init(hex3: hexVal, alpha: alpha)
        case 6:
            self.init(hex6: hexVal, alpha: alpha)
        default:
            self.init()
            return nil
        }
    }

    private convenience init?(hex3: Int, alpha: CGFloat) {
        self.init(red: CGFloat(((hex3 & 0xF00) >> 8).duplicate4bits()) / 255.0,
                green: CGFloat(((hex3 & 0x0F0) >> 4).duplicate4bits()) / 255.0,
                blue: CGFloat(((hex3 & 0x00F) >> 0).duplicate4bits()) / 255.0,
                alpha: CGFloat(alpha))
    }

    private convenience init?(hex6: Int, alpha: CGFloat) {
        self.init(red: CGFloat((hex6 & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((hex6 & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat((hex6 & 0x0000FF) >> 0) / 255.0,
                alpha: CGFloat(alpha))
    }

}

private extension Int {
    func duplicate4bits() -> Int {
        return (self << 4) + self
    }
}
