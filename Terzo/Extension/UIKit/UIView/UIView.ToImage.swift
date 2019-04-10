//
// Created by Mengyu Li on 2018/4/10.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    /// 将view转化为图片
    @objc
    public func toImage(scale: CGFloat = UIScreen.main.scale) -> UIImage? {
        if #available(iOS 10.0, *) {
            let format = UIGraphicsImageRendererFormat()
            format.scale = scale
            let renderer = UIGraphicsImageRenderer(bounds: bounds, format: format)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        }

        // 此行控制台会有警告，不加iOS8系统无法截图
        self.drawHierarchy(in: bounds, afterScreenUpdates: true)

        layer.contentsScale = scale
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, scale)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        self.layer.render(in: context)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

    @objc
    public func toImage() -> UIImage? {
        return toImage(scale: UIScreen.main.scale)
    }

    public func toImage(in rect: CGRect,
                        scale: CGFloat = UIScreen.main.scale) -> UIImage? {
        guard let img = toImage(scale: scale),
              let cgImage = img.cgImage else {
            return nil
        }
        let r = CGRect(x: rect.minX * scale,
                y: rect.minY * scale,
                width: rect.width * scale,
                height: rect.height * scale)
        guard let imgRef = cgImage.cropping(to: r) else {
            return nil
        }
        let retImg = UIImage(cgImage: imgRef)
        return retImg
    }

    public func easyToImage(size: CGSize? = nil) -> UIImage? {
        let clipSize = size ?? self.bounds.size
        UIGraphicsBeginImageContextWithOptions(clipSize, false, UIScreen.main.scale)
        for subview in self.subviews {
            var afterScreenUpdates = true
            if subview.isKind(of: UINavigationBar.self) {
                afterScreenUpdates = false
            }
            subview.drawHierarchy(in: subview.frame, afterScreenUpdates: afterScreenUpdates)
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

}
