//
//  ContentView.swift
//  DigestibleApp
//
//  Created by Noel Thomas on 2020-08-14.
//  Copyright © 2020 Noel Thomas. All rights reserved.
//

import SwiftUI

struct Cell {
    var id = UUID()
    var headline, text, imageName: String
}


struct ContentView: View {
    
    let testData = [
        Cell(headline:"Hello World!", text: "Lorem ipsum dolor...", imageName: "Tim")
    ]
    
    var body: some View {
        ScrollView{
                CellView()
        }
    }
}

struct CellView: View {
    var body: some View {
        Image("Tim")
        .resizable()
        .frame(width: UIScreen.main.bounds.width, height: 200)
        .contextMenu {
            Button(action: {
                // Open actionsheeet to share
            }) {
                Text("Share")
                Image(systemName: "square.and.arrow.up")
                    .font(Font.title.weight(.light))
            }
                
            Button(action: {
                // Save
            }) {
                Text("Save")
                Image(systemName: "tray.and.arrow.down")
            }
            
            Button(action: {
                // Like
            }) {
                Text("Like")
                Image(systemName: "suit.heart")
            }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
