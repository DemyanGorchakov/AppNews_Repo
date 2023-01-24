//
//  Service.swift
//  AppNews
//
//  Created by Демьян Горчаков on 21.01.2023.
//

import Foundation
import Alamofire

class Service {
    
    func getNews(complition: @escaping (News) ->()) {
        
        let url = "https://newsapi.org/v2/top-headlines"
        
        let parameters: Parameters = [
            "country":"ru",
            "category":"business",
            "apiKey":"35c8d456901045ecb36da1db39cf365e",
        ]
        
        AF.request(url, method: .get, parameters: parameters).response { result in
            if let data = result.data {
                if let items = try? JSONDecoder().decode(News.self, from: data) {
                    complition(items)
                }
            }
        }
    }
}

