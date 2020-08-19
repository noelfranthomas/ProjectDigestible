//
//  Article.swift
//  Digestible
//
//  Created by Athul Rajagopal on 2020-08-18.
//  Copyright © 2020 DigestLabs. All rights reserved.
//

import SwiftUI

struct Article: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivatevar var imageName: String
    var category: Category
    var isFavorite: Bool
    var isFeatured: Bool
    var isTrending: Bool
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case trending = "Trending"
    }
}
