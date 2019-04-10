//
// Created by Mengyu Li on 2018/4/24.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

import Foundation

extension Array {
    ///将一个数组切块
    public func chunks(_ chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: chunkSize).map {
            Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
        }
    }
}