//
//  NetworkingError.swift
//  NewsApp
//
//  Created by Artem Doloban on 04.11.2023.
//

import Foundation

enum NetworkingError: Error {
    case networkingError(_ error: Error)
    case unknown
}
