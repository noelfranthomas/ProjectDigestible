/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that shows a featured landmark.
*/

import SwiftUI

struct FeatureArticle: View {
    var article: Article
    
    var body: some View {
        article.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay(TextOverlay(landmark: article))
    }
}

struct TextOverlay: View {
    var landmark: Article
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.state)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureArticle_Previews: PreviewProvider {
    static var previews: some View {
        FeatureArticle(article: features[0])
    }
}
