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
                    Spacer()
                }
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            Text("The content of the second view")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
            }
            RedView()
            .tabItem{
                Image(systemName: "text.bubble")
                Text("Forums")
            }
            BlueView()
            .tabItem{
                Image(systemName: "person.circle")
                Text("Profile")
            }
            
        }
        
    }
    
}

struct RedView: View {
    var body : some View {
        Color.red
    }
}

struct BlueView: View {
    var body : some View {
        Color.blue
    }
}

//The below structure is for previewing and development only
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

