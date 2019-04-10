//
// Created by Mengyu Li on 2018/4/10.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

import UIKit

extension UIScrollView {
    public func scrollToBottom(animated: Bool) {
        let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
        self.setContentOffset(bottomOffset, animated: animated)
    }
}