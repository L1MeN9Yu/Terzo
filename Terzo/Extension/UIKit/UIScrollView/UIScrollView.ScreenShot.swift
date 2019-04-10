//
// Created by Mengyu Li on 2018/5/23.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    public func screenShot() -> UIImage {
        var image: UIImage?
        let oldContentOffset = self.contentOffset
        let oldFrame = self.frame

        if self.contentSize.height > self.frame.size.height {
            self.contentOffset = CGPoint(x: 0, y: self.contentSize.height - self.frame.size.height)
        }

        self.frame = CGRect(x: 0, y: 0, width: self.contentSize.width, height: self.contentSize.height)

        Thread.sleep(forTimeInterval: 0.3)

        self.contentOffset = .zero

        autoreleasepool {
            UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)

            for subview in self.subviews {
                subview.drawHierarchy(in: subview.frame, afterScreenUpdates: true)
            }
            image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }

        self.frame = oldFrame
        self.contentOffset = oldContentOffset

        return image ?? UIImage()
    }
}