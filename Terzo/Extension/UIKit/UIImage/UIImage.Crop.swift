//
// Created by Mengyu Li on 2018/8/24.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    public func crop(rect: CGRect) -> UIImage? {
        var rect = rect
        rect.origin.x *= self.scale
        rect.origin.y *= self.scale
        rect.size.width *= self.scale
        rect.size.height *= self.scale

        if let imageRef = self.cgImage?.cropping(to: rect) {
            let image = UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)
            return image
        }
        return nil
    }
}