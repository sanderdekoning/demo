//
//  URLFetcherProtocol.swift
//  AppReviews
//
//  Created by Sander de Koning on 03/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

protocol URLFetcherProtocol {
    func fetch<RS: SourceURLProtocol>(from source: RS) async throws -> RS.responseModel
}
