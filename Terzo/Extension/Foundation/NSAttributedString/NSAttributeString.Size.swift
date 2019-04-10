//
// Created by Mengyu Li on 2018/3/7.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

import Foundation
import UIKit

extension NSAttributedString {
    public func height(withConstrainedWidth width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)

        return ceil(boundingBox.height)
    }

    public func width(withConstrainedHeight height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)

        return ceil(boundingBox.width)
    }

    public var maxSize: CGSize {
        return self.boundingRect(with: CGSize(CGFloat.greatestFiniteMagnitude,
                CGFloat.greatestFiniteMagnitude),
                options: [],
                context: nil).size
    }
    
    /// 实际上文本展示的高度（去除异常的lineSpacing）
    public func realityHeight(withConstrainedWidth width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        var height = boundingBox.height
        
        //  获取attributeString的内容，判断是否有非英文、数字的字符串
        let str = self.string
        var containLatinLanguage = false
        
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z0-9\\s,.:;!-_+=!?`].*", options: [])
            if regex.firstMatch(in: str, options: [], range: NSMakeRange(0, str.count)) != nil {
                containLatinLanguage = true
            } else {
                containLatinLanguage = false
            }
        } catch {
            
        }
        
        //  如果包含拉丁文字母，计算原文高度是否大于1行高度，如果大于1行高度且小于2行高度，则需要减去1个lineSpacing的高度
        if containLatinLanguage {
            
            var lineSpacing: CGFloat = 0
            if let paragraphStyle = self.attribute(NSAttributedString.Key.paragraphStyle, at: 0, effectiveRange: nil) as? NSMutableParagraphStyle {
                lineSpacing = paragraphStyle.lineSpacing
            }
            
            //  计算一行（无lineSpacing）和两行高度（有lineSpacing）
            let tempConstraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
            let tempBoundingBox = self.boundingRect(with: tempConstraintRect, options: .usesLineFragmentOrigin, context: nil)
            let singleLineHeight = tempBoundingBox.height - lineSpacing
            let doubleLineHeight = singleLineHeight * 2 + lineSpacing
            
            //  如果大于1行高度且小于2行高度，则需要减去1个lineSpacing的高度
            if height > singleLineHeight && height < doubleLineHeight {
                height = height - lineSpacing
            }
        }
        return ceil(height)
    }
    
    /// 计算指定行数的高度(多行包含lineSpacing，单行不包括lineSpacing)
    public func numberOfLineHeight(withConstrainedWidth width: CGFloat, numberOfLine: UInt) -> CGFloat {
        var lineSpacing: CGFloat = 0
        if let paragraphStyle = self.attribute(NSAttributedString.Key.paragraphStyle, at: 0, effectiveRange: nil) as? NSMutableParagraphStyle {
            lineSpacing = paragraphStyle.lineSpacing
        }
        //  计算一行（无lineSpacing）
        let tempConstraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        let tempBoundingBox = self.boundingRect(with: tempConstraintRect, options: .usesLineFragmentOrigin, context: nil)
        let singleLineHeight = tempBoundingBox.height - lineSpacing
        
        let height: CGFloat = singleLineHeight * CGFloat(numberOfLine) + CGFloat(numberOfLine) >= 1 ? (CGFloat(numberOfLine) - 1) * lineSpacing : 0
        
        return ceil(height)
    }
}
