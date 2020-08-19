//
//  ImageContainer.swift
//  Digestible
//
//  Created by Athul Rajagopal on 2020-08-16.
//  Copyright © 2020 DigestLabs. All rights reserved.
//


//DEPRECATED FILE, see PageView.swift

import SwiftUI

struct ImageContainer: View {
    var body: some View {
        ZStack {
            Image ("blm")
                .resizable()
                .frame(height: 620)
                .cornerRadius(10)
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.white)
                .frame(height: 100)
                .offset(y: -260)
            HStack {
                VStack (alignment: .leading) {
                    Text ("Black Lives Matter May Be the Largest Movement in US History")
                        .font(.headline)
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                        .lineLimit(2)
                    HStack{
                        Image ("nytimes")
                            .resizable()
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 40)
                        Text ("New York Times")
                            .font(.headline)
                            .foregroundColor(Color.gray)
                    }
                }
                .offset(x: 5, y: -260)
                Spacer()
            }
        }.padding()
    }
}

struct ImageContainer_Previews: PreviewProvider {
    static var previews: some View {
        ImageContainer()
    }
}
