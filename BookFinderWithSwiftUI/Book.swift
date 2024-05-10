//
//  Book.swift
//  BookFinderWithSwiftUI
//
//  Created by 김연지 on 5/10/24.
//

import SwiftUI

struct Book: Codable, Identifiable {
    var title: String
    var publisher: String
    var authors:[String]
    var thumbnail:String
    var url:String
    var price:Int
    var id: String
    
    enum CodingKeys:String, CodingKey{
        case title, publisher, authors, thumbnail, url, price
        case id = "isbn"
    }
}

struct Meta: Codable {
    var isEnd: Bool
    
    enum CodingKeys:String, CodingKey{
        case isEnd = "is_end"
    }
}

struct SResult: Codable {
    var meta: Meta
    var books: [Book]
    
    enum CodingKeys: String, CodingKey{
        case meta
        case books = "documents"
    }
}
