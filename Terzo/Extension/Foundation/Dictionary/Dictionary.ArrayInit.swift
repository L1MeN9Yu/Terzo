//
// Created by Mengyu Li on 2018/8/5.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

extension Dictionary {
    public init(keys: [Key], values: [Value]) {
        self.init()

        for (key, value) in zip(keys, values) {
            self[key] = value
        }
    }
}