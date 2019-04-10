//
// Created by yinqianpeng on 2018/3/31.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

import Foundation
import UIKit

extension NSAttributedString {
    public func replaceColor(color: UIColor) -> NSMutableAttributedString {
        let attr = NSMutableAttributedString(attributedString: self)
        attr.addAttribute(NSAttributedString.Key.foregroundColor,
                value: color,
                range: NSRange(location: 0, length: self.string.count))
        return attr
    }
}
