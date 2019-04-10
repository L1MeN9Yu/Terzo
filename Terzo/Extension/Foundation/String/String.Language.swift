//
// Created by Mengyu Li on 2018/9/12.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

import Foundation

/**
 * https://en.wikipedia.org/wiki/Unicode_character_property
 */

extension String {
    public enum ChineseRange {
        case notFound, contain, all
    }

    /// 包含中文的情况
    public var chineseRange: ChineseRange {
        guard let range = self.range(of: "\\p{Han}*\\p{Han}", options: .regularExpression) else {
            return .notFound
        }
        var result: ChineseRange
        switch range {
        case nil:
            result = .notFound
        case self.startIndex..<self.endIndex:
            result = .all
        default:
            result = .contain
        }
        return result
    }
}