//
//  ArticleContainer.swift
//  Digestible
//
//  Created by Athul Rajagopal on 2020-08-16.
//  Copyright © 2020 DigestLabs. All rights reserved.
//

import SwiftUI

struct ArticleContainer: View {
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Text("Black Lives Matter May Be the Largest Movement in US History")
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    Text("Larry Buchanan\n")
                    Spacer()
                    Text("July 3, 2020\n")
                }.font(.headline)
                .foregroundColor(Color.gray)
                Text("The recent Black Lives Matter protests peaked on June 6, when half a million people turned out in nearly 550 places across the United States. That was a single day in more than a month of protests that still continue to today.\n")
                    .font(.title)
                Text("Four recent polls — including one released this week by Civis Analytics, a data science firm that works with businesses and Democratic campaigns — suggest that about 15 million to 26 million people in the United States have participated in demonstrations over the death of George Floyd and others in recent weeks.\n")
                    .font(.title)
                Text("These figures would make the recent protests the largest movement in the country’s history, according to interviews with scholars and crowd-counting experts.")
                    .font(.title)
            }.padding()
        }
    }
}

struct ArticleContainer_Previews: PreviewProvider {
    static var previews: some View {
        ArticleContainer()
    }
}
