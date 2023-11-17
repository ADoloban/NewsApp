//
//  NewsResponceObject.swift
//  NewsApp
//
//  Created by Artem Doloban on 03.11.2023.
//

import Foundation

struct NewsResponceObject: Codable {
    let totalResults: Int
    let articles: [ArticleResponceObject]
    
    enum CodingKeys: CodingKey {
        case totalResults
        case articles
    }
}
