//
// Created by Mengyu Li on 2019-04-10.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

import Foundation

extension URL {
    public init?(string: String?) {
        guard let s = string else { return nil }
        self.init(string: s)
    }
}