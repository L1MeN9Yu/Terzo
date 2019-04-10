//
// Created by yinqianpeng on 2018/3/31.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    public func setFontAttribute(str: String? = nil,
                                 font: UIFont? = nil,
                                 lineSpacing: CGFloat = 0,
                                 color: UIColor? = nil,
                                 range: NSRange = NSRange(location: 0, length: 0)) {

        var newRange = NSRange(location: 0, length: self.string.count)
        if range != NSRange(location: 0, length: 0) {
            newRange = range
        }

        if let color = color {
            self.addAttribute(NSAttributedString.Key.foregroundColor,
                    value: color,
                    range: newRange)
        }
        if let font = font {
            self.addAttribute(NSAttributedString.Key.font,
                    value: font,
                    range: newRange)
        }
        if lineSpacing != 0 {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing
            self.addAttribute(NSAttributedString.Key.paragraphStyle,
                    value: paragraphStyle,
                    range: newRange)
        }
    }
}
