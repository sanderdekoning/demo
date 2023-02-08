//
//  URLSession+Mocked.swift
//  AppReviewsTests
//
//  Created by Sander de Koning on 08/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

extension URLSession {
    static var mocked: Self {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]

        return Self(configuration: config)
    }
}
