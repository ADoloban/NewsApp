//
//  ApiManager.swift
//  NewsApp
//
//  Created by Artem Doloban on 03.11.2023.
//

import Foundation

//Create url path and make request

final class ApiManager {
    enum Category: String {
        case general = "general"
        case business = "business"
        case technology = "technology"
    }
    private static let apiKey = "37b6a325ac7940cc94b3ee682ac4472f"
    private static let baseUrl = "https://newsapi.org/v2/"
    private static let path = "top-headlines"
    
    static func getNews(from category: Category, completion: @escaping (Result<[ArticleResponceObject],Error>) -> ()) {
        let stringUrl = baseUrl + path + "?category=\(category.rawValue)&language=en" + "&apiKey=\(apiKey)"
        
        guard let url = URL(string: stringUrl) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, _, error in
            handleResponse(data: data,
                           error: error,
                           completion: completion)
        }
        session.resume()
    }
    
    static func getImageData(url: String, completion: @escaping (Result<Data,Error>) -> ()) {
         
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                completion(.success(data))
            }
            if let error = error {
                completion(.failure(error))
            }
        }
        
        session.resume()
    }
    //Handle responce
    private static func handleResponse(data: Data?,
                                       error: Error?,
                                       completion: @escaping (Result<[ArticleResponceObject],Error>) -> ()) {
        if let error = error {
            completion(.failure(NetworkingError.networkingError(error)))
        } else if let data = data {
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            do {
                let model = try JSONDecoder().decode(NewsResponceObject.self, from: data)
                
                completion(.success(model.articles))
            }
            catch let decodeError {
                completion(.failure(decodeError))
            }
        } else {
            completion(.failure(NetworkingError.unknown))
        }
    }
}
