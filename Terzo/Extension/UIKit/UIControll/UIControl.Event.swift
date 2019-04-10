//
// Created by Mengyu Li on 2018/4/10.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

import UIKit

private var buttonEventBlockKey: Void?

extension UIControl {
    public func event(block: ((UIControl) -> Void)?) {
        self.buttonEventBlock = block
        guard let _ = block else {
            self.removeTarget(self, action: #selector(UIControl.touchUpInsideEvent), for: .touchUpInside)
            return
        }
        self.addTarget(self, action: #selector(UIControl.touchUpInsideEvent), for: .touchUpInside)
    }

    @objc
    private func touchUpInsideEvent(_ sender: UIControl) {
        if let b = self.buttonEventBlock {
            b(sender)
        }
    }

    private var buttonEventBlock: ((UIControl) -> Void)? {
        get {
            return objc_getAssociatedObject(self, &buttonEventBlockKey) as? ((UIControl) -> Void)
        }
        set {
            objc_setAssociatedObject(self, &buttonEventBlockKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}