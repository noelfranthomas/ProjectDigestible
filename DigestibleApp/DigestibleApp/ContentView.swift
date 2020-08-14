//
//  ContentView.swift
//  DigestibleApp
//
//  Created by Noel Thomas on 2020-08-14.
//  Copyright © 2020 Noel Thomas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(0..<10) {
                    Text("Item \($0)")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - (0.1*UIScreen.main.bounds.size.height))

                        .background(Color.red)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
