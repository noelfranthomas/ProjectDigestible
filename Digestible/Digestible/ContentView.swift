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
        TabView {
            ZStack {
                Color.gray.edgesIgnoringSafeArea(.all)
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
                    Spacer()
                }
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            Text("Content of the second view")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
            }
            RedView()
            .tabItem{
                Image(systemName: "text.bubble")
                Text("Forums")
            }
            PageView([Image("nytimes"), Image("nytimes")])
            .tabItem{
                Image(systemName: "person.circle")
                Text("Profile")
            }
        }
        
    }
    
}

struct RedView: View {
    var body : some View {
        Color.red.edgesIgnoringSafeArea(.all)
    }
}

struct BlueView: View {
    var body : some View {
        Color.blue.edgesIgnoringSafeArea(.all)
    }
}

//The below structure is for previewing and development only
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

