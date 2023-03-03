//
//  ReviewsURLSourceProtocol.swift
//  AppReviews
//
//  Created by Sander de Koning on 03/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

protocol ReviewsURLSourceProtocol {
    associatedtype responseModel: Decodable
    
    var url: URL { get throws }
    
    var parser: ReviewsParserProtocol { get }
}
