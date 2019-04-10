//
// Created by Mengyu Li on 2018/4/10.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

import Foundation
import UIKit

extension UIScreen {
    // 屏幕宽度
    public static var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    // 屏幕高度
    public static var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    // 屏幕的最小边框
    public static var screenMinLength: CGFloat {
        return min(screenWidth, screenHeight)
    }
    // 屏幕的最大边框
    public static var screenMaxLength: CGFloat {
        return max(screenWidth, screenHeight)
    }

    public static func isScreenSizeEqual(_ size: CGSize) -> Bool {
        return UIScreen.main.bounds.size.equalTo(size)
    }
}
