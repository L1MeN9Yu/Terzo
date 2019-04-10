//
// Created by Mengyu Li on 2019-04-10.
// Copyright (c) 2019 L1MeN9Yu. All rights reserved.
//

import Foundation

extension URL {
    public var queryParametersDictionary: [String: String]? {

        guard let urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false) else { return nil }

        guard let queryItems = urlComponents.queryItems else { return nil }

        var queryParams = [String: String]()
        queryItems.forEach { item in
            guard let value = item.value, item.name.count > 0 else { return }
            queryParams[item.name] = value
        }

        return queryParams
    }
}