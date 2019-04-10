//
// Created by Mengyu Li on 2018/4/20.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

import UIKit

extension UIColor {
    public class var random: UIColor {
        let hue: CGFloat = CGFloat(Int.random(in: 1...256)) / 256
        let saturation: CGFloat = CGFloat(Int.random(in: 1...128)) / 256 + 0.5
        let brightness: CGFloat = CGFloat(Int.random(in: 1...128)) / 256 + 0.5
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
}