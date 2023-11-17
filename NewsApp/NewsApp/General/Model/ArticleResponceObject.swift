//
//  ArticleResponceObject.swift
//  NewsApp
//
//  Created by Artem Doloban on 03.11.2023.
//

import Foundation

struct ArticleResponceObject: Codable {
    let title: String
    let description: String
    let urlToImage: String
    let date: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case urlToImage
        case date = "publishedAt"
    }
}
