//
// Created by Mengyu Li on 2018/4/10.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

import Foundation

//range转换为NSRange
extension String {
    public func nsRange(from range: Range<Index>) -> NSRange {
        return NSRange(range, in: self)
    }
}