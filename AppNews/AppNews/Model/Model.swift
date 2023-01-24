//
//  Model.swift
//  AppNews
//
//  Created by Демьян Горчаков on 21.01.2023.
//

import Foundation


struct News: Decodable {
    var articles: [Articles]
}

struct Articles: Decodable {
    var author: String?
    var title: String?
    var description: String?
    var urlToImage: String?
}
