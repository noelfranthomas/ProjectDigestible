//
//  ContentView.swift
//  DigestibleApp
//
//  Created by Noel Thomas on 2020-08-14.
//  Copyright © 2020 Noel Thomas. All rights reserved.
//

import SwiftUI

//This is cool to make the cards numbered

extension View {
    func stacked(at position: Int, in total: Int)
        -> some View {
            let offset = CGFloat(total - position)
            return self.offset(CGSize(width: offset * 10, height: 0))
    }
}

struct ContentView: View {
//    @State private var cards = [Card](repeating: Card.example, count: 2)
    
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
                            PageViewer()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke())
                            .padding(5)
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
            PageViewer()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
            }
            RedView()
            .tabItem{
                Image(systemName: "text.bubble")
                Text("Forums")
            }
            ProfileView()
            .tabItem{
                Image(systemName: "person.circle")
                Text("Profile")
            }
        }
        
        
        
        
        
        
        
        
        
        
        
//        ZStack {
//            ForEach(0..<cards.count, id: \.self) {index in
//                CardView(card: self.cards[index])
//                    .stacked(at: index, in: self.cards.count)
//            }
//         }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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

struct PageViewer: View {
var body : some View {
    PageView(landmarkData.map { FeatureArticle(article: $0) })
    }
}

struct ZCardView : View {
    var body: some View{
            ZStack{
                    Image("Donald")
                        .resizable()
                        .frame(width: 350, height: 350)
                        .clipped()
                        .cornerRadius(10)
                    FrontCardView()
            }.frame(width: UIScreen.main.bounds.width)
    }
    
    struct FrontCardView : View {
    
    @State var click = false
    @State var holding = false
    @State var angle = 0
    @State var offset: CGSize = .zero
    
    
    var body: some View{
        
        let drag = DragGesture()
            .onChanged{ self.offset = $0.translation
                if self.offset != .zero {
                    self.angle = 3
                }
        }
            .onEnded{
                if $0.translation.width < -100 {
                    self.offset = .init(width: -345, height: 0)
                    self.angle = 0
                }
                else{
                    self.offset = .zero
                }
                if self.offset == .zero {
                    self.angle = 0
                }
        }
        
        return
                Image("Tim")
                    .frame(width: UIScreen.main.bounds.width - 10, height: self.click ? UIScreen.main.bounds.height - 50 : 600)
                    .cornerRadius(10)
                    .shadow(radius: self.click ? 5 : 0, x: self.click ? 10 : 0, y: self.click ? 10 : 0)
                    .rotationEffect(Angle(degrees: Double(self.angle)))
                    .offset(x: self.click ? self.offset.width : .zero, y: self.click ? self.offset.height : .zero)
                    .gesture(self.click ? drag : nil)
                    .animation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 0))
                    .onTapGesture {
                        if self.offset.width == 0 {
                            self.click.toggle()
                        }
                    }
        }
    }
}
