/*
Abstract:
The model for an individual article.
*/

import SwiftUI

struct Article: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var logoName: String
    var author: String
    var date: String
    var text: String
    var source: String
    var category: Category
    var isFavorite: Bool
    var isFeatured: Bool
    
    var featureImage: Image? {
        guard isFeatured else { return nil }
        
        return Image(
            ImageStore.loadImage(name: "\(imageName)"),
            scale: 2,
            label: Text(name))
    }

    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}

extension Article {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
    var logo: Image {
        ImageStore.shared.image(name: logoName)
    }
}
