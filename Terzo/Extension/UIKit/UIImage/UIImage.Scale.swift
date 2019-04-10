//
//  UIImage.Scale.swift
//
//  Created by Mengyu Li on 2017/10/20.
//  Copyright © 2019 L1MeN9Yu. All rights reserved.
//

import UIKit

extension UIImage {

    /// 缩放图片到指定大小
    @available(*, deprecated, message: "使用public func scale(to size: CGSize, opaque: Bool = false) -> UIImage?")
    @objc
    public func scale(toSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(toSize, true, UIScreen.main.scale)
        self.draw(in: CGRect(origin: .zero, size: toSize))
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }

    /// 缩放图片到指定大小
    public func scale(to size: CGSize, opaque: Bool = false) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, opaque, UIScreen.main.scale)
        self.draw(in: CGRect(origin: .zero, size: size))
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }

    public func scaleProportion(toSize: CGSize) -> UIImage? {
        if size.width <= 0, size.height <= 0 {
            return nil
        }
        UIGraphicsBeginImageContextWithOptions(toSize, false, self.scale);
        self.draw(in: CGRect(origin: .zero, size: toSize))
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    }

    /// - Parameters:
    ///   - size:       图片大小
    ///   - radius:     圆角值
    ///   - fillColor:  裁切区域填充颜色
    public func cornerImage(size: CGSize, radius: CGFloat, fillColor: UIColor, location: UIRectCorner) -> UIImage? {
        //利用绘图建立上下文
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)

        //设置填充颜色
        fillColor.setFill()
        UIRectFill(rect)
        //利用贝塞尔路径裁切
        let path: UIBezierPath = UIBezierPath.init(roundedRect: rect, byRoundingCorners: location, cornerRadii: CGSize(radius, radius))
        path.addClip()

        self.draw(in: rect)
        //获取结果
        let resultImage = UIGraphicsGetImageFromCurrentImageContext()

        //关闭上下文
        UIGraphicsEndImageContext()
        return resultImage
    }
}
