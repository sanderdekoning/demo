//
//  ReviewsParserProtocol.swift
//  AppReviews
//
//  Created by Sander de Koning on 03/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

protocol ReviewsParserProtocol {
    func parse<D: Decodable>(data: Data, to type: D.Type) throws -> D
}
