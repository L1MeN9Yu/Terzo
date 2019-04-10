//
// Created by Mengyu Li on 2018-12-18.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

import UIKit

extension UIImage {
    /// 压缩图片到指定大小(B)压缩系数默认为0.9(即每次以上次大小的0.9倍压缩)
    public func compress(limitSize: UInt, factor: CGFloat = 0.9) -> UIImage? {
        guard let jpegData = self.jpegData(compressionQuality: 1.0) else { return self }
        var resultData = jpegData
        var resultImage = self
        while resultData.count > limitSize {
            let size = CGSize(width: resultImage.size.width * factor, height: resultImage.size.height * factor)
            guard let compressImage = self.scale(to: size, opaque: false) else { return self }
            resultImage = compressImage
            guard let compressData = compressImage.jpegData(compressionQuality: 1.0) else { return self }
            resultData = compressData
        }

        return resultImage
    }
}
