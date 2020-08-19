//
//  ArticleReader.swift
//  Digestible
//
//  Created by Athul Rajagopal on 2020-08-19.
//  Copyright © 2020 DigestLabs. All rights reserved.
//

import SwiftUI

struct ArticleReader: View {
    var article: Article
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Text(article.name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                HStack {
                    Text(article.author)
                    Spacer()
                    Text(article.date)
                    Text("\n")
                }.font(.headline)
                .foregroundColor(Color.gray)
                Text(article.text)
                        .font(.title)
                        .foregroundColor(Color.black)
            }.padding()
        }.background(Color.white).cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke()).padding(5)
    }
}

struct ArticleReader_Previews: PreviewProvider {
    static var previews: some View {
        ArticleReader(article: articleData[0])
    }
}
