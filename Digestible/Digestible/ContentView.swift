//
//  ContentView.swift
//  Digestible
//
//  Created by Athul Rajagopal on 2020-08-13.
//  Copyright © 2020 DigestLabs. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isTapped = false
    
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(Color.gray).edgesIgnoringSafeArea(.all)
            VStack {
                Text("DIGESTIBLE")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.orange)
                Button(action: {
                    self.isTapped.toggle()
                }) {
                    if isTapped {
                        ArticleContainer()
                    }
                    else {
                        ScrollView {
                            ImageContainer()
                        }
                    }
                }
                .buttonStyle(PlainButtonStyle())
                /*Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nec tempor odio...")
                    .fontWeight(.semibold)
                    .padding()*/
                Spacer()
            }
        }
        
    }
}

//The below structure is for previewing and development only
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

