//
//  ContentView.swift
//  Digestible
//
//  Created by Athul Rajagopal on 2020-08-13.
//  Copyright © 2020 DigestLabs. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("DIGESTIBLE")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color.orange)
            Image("blm")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 620)
            /*Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nec tempor odio...")
                .fontWeight(.semibold)
                .padding()*/
            Spacer()
        }
    }
}

//The below structure is for previewing and development only
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

