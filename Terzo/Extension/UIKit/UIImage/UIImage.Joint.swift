//
// Created by Mengyu Li on 2018/5/23.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    public class func imageJointFromArray(imageList: [UIImage]) -> UIImage {
        var image: UIImage?
        autoreleasepool {
            let totalSize = self.imageTotalSizeFromArray(imageList: imageList)
            UIGraphicsBeginImageContextWithOptions(totalSize, false, UIScreen.main.scale)
            var imageOffset: CGFloat = 0
            for image in imageList {
                image.draw(at: CGPoint(x: 0, y: imageOffset))
                imageOffset += image.size.height
            }
            image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
        return image ?? UIImage()
    }

    private class func imageTotalSizeFromArray(imageList: [UIImage]) -> CGSize {
        var totalSize: CGSize = .zero
        for image in imageList {
            let imageSize = image.size
            totalSize.height += imageSize.height;
            totalSize.width = max(totalSize.width, imageSize.width);
        }
        return totalSize
    }
}