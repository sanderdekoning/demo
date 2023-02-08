//
//  URLProtocolMock.swift
//  AppReviewsTests
//
//  Created by Sander de Koning on 08/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

class URLProtocolMock: URLProtocol {
    static var requestHandler: ((URLRequest) throws -> MockURLResponse)?
    
    override class func canInit(with request: URLRequest) -> Bool {
        true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }
    
    override func stopLoading() {  }

    override func startLoading() {
         guard let handler = URLProtocolMock.requestHandler else {
            return
        }

        do {
            let response = try handler(request)
            client?.urlProtocol(self, didReceive: response.response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: response.data)
            client?.urlProtocolDidFinishLoading(self)
        } catch  {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
}

extension URLProtocolMock {
    struct MockURLResponse {
        let response: HTTPURLResponse
        let data: Data
    }
}
