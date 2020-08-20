//
//  ContentView.swift
//  DigestibleApp
//
//  Created by Noel Thomas on 2020-08-14.
//  Copyright © 2020 Noel Thomas. All rights reserved.
//

import SwiftUI

struct ContentView: View {

     var colors = ["Haic", "Hi", "Hello"]

       var body: some View {
           VStack {
                ProfileView()
            }
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

