//
//  ReviewsMostWordOccurancesInsights.swift
//  AppReviews
//
//  Created by Sander de Koning on 07/02/2023.
//  Copyright © 2023 Into Ventures. All rights reserved.
//

import Foundation

struct ReviewsMostWordOccurancesInsights: ReviewsInsights {
    typealias Insights = [String]
    
    let fields: [KeyPath<Review, String>]
    let preTransform: (([String]) -> Insights)?
    let minimumWordLength: Int?
    let limit: Int?
    
    func process(reviews: [Review]) -> Insights {
        // Create a dictionary with all words and their frequency
        let wordFrequencies = wordsFrequencies(from: reviews)
        
        // Create an array containing all the words
        let words = Array(wordFrequencies.keys)
        
        // Apply any pretransform to the words, such as an alphabetical sort
        let transformed = preTransform?(words) ?? words
        
        // Sort the transformed words by frequency
        let sorted = transformed.sorted {
            wordFrequencies[$0] ?? 0 > wordFrequencies[$1] ?? 0
        }
        
        // If a limit has been configured n first elements are returned
        if let limit {
            return Array(sorted.prefix(limit))
        } else {
            return sorted
        }
    }
    
    private func wordsFrequencies(from reviews: [Review]) -> [String: Int] {
        // Store the words in a dictionary as key with their frequency as the value
        var wordFrequencies: [String: Int] = [:]

        reviews.forEach { review in
            // Get all the words in the configured key path values
            fields.forEach { field in
                review[keyPath: field].enumerateSubstrings(
                    in: review[keyPath: field].startIndex...,
                    options: .byWords
                ) { word, _, _, _ in
                    // For each word with length longer than the minimum word length increment
                    // the frequency value
                    if let word = word?.lowercased(), word.count >= minimumWordLength ?? 0 {
                        wordFrequencies[word] = 1 + (wordFrequencies[word] ?? 0)
                    }
                }
            }
        }
        
        return wordFrequencies
    }
}
