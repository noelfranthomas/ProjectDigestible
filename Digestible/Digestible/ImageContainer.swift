//
//  ImageContainer.swift
//  Digestible
//
//  Created by Athul Rajagopal on 2020-08-16.
//  Copyright © 2020 DigestLabs. All rights reserved.
//

import SwiftUI

struct ImageContainer: View {
    var body: some View {
        ZStack {
            Image ("blm")
                .resizable()
                .frame(height: 620)
                .cornerRadius(10)
                .padding()
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.white)
                .frame(height: 100)
                .padding()
                .offset(y: -260)
        }
    }
}

struct ImageContainer_Previews: PreviewProvider {
    static var previews: some View {
        ImageContainer()
    }
}
