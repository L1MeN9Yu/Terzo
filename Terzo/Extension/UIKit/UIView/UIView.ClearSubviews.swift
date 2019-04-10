//
// Created by Mengyu Li on 2018/4/10.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    public func clearSubviews() {
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
}
