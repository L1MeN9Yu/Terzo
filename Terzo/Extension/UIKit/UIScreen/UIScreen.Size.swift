//
// Created by Mengyu Li on 2018/4/10.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

import Foundation
import UIKit

#if os(iOS)
extension UIScreen {
    // 屏幕宽度
    public static var width: CGFloat { return UIScreen.main.bounds.width }
    // 屏幕高度
    public static var height: CGFloat { return UIScreen.main.bounds.height }
    // 屏幕的最小边框
    public static var minLength: CGFloat { return min(width, height) }
    // 屏幕的最大边框
    public static var maxLength: CGFloat { return max(width, height) }

    public static func isScreenSizeEqual(_ size: CGSize) -> Bool { return UIScreen.main.bounds.size.equalTo(size) }
}
#endif

extension UIScreen {
    public var width: CGFloat { return self.bounds.width }

    public var height: CGFloat { return self.bounds.height }

    public var minLength: CGFloat { return min(width, height) }

    public var maxLength: CGFloat { return max(width, height) }

    public func isScreenSizeEqual(to size: CGSize) -> Bool { return self.bounds.size.equalTo(size) }
}
