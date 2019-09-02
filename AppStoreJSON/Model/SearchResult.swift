//
//  SearchResult.swift
//  AppStoreJSON
//
//  Created by Jason Yu on 9/1/19.
//  Copyright © 2019 Jason Yu. All rights reserved.
//

import Foundation

    struct SearchResult: Decodable{
        let resultCount: Int
        let results: [Result]
    }

    struct Result: Decodable {
        let trackName: String
        let primaryGenreName: String
        let userRatingCount: Int?
    }
