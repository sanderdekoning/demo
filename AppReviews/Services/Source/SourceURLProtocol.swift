//
//  SourceURLProtocol.swift
//  AppReviews
//
//  Created by Sander de Koning on 03/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

protocol SourceURLProtocol {
    associatedtype responseModel: Decodable
    
    var url: URL { get throws }
    
    var parser: ParserProtocol { get }
}
