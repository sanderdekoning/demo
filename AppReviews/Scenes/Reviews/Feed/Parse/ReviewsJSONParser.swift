//
//  ReviewsParser.swift
//  AppReviews
//
//  Created by Sander de Koning on 02/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

class ReviewsJSONParser: ParserProtocol {
    private lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func parse<T: Decodable>(data: Data, to type: T.Type) throws -> T {
        try decoder.decode(type, from: data)
    }
}
