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
            .frame(height: 620)
            .cornerRadius(10)
            .overlay(TextOverlay(article: article))
            .padding()
    }
}

struct TextOverlay: View {
    var article: Article

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.white)
                .frame(height: 100)
                .offset(y: -260)
            HStack {
                VStack(alignment: .leading) {
                    Text(article.name)
                        .font(.headline)
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                        .lineLimit(2)
                    HStack {
                        article.logo
                            .resizable()
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 40)
                        Text(article.state)
                            .font(.headline)
                            .foregroundColor(Color.gray)
                    }
                }
                Spacer()
            }
            .offset(x: 5, y: -260)
        }
    }
}

struct FeatureArticle_Previews: PreviewProvider {
    static var previews: some View {
        FeatureArticle(article: features[0])
    }
}
