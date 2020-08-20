//
//  CardView.swift
//  DigestibleApp
//
//  Created by Noel Thomas on 2020-08-20.
//  Copyright © 2020 Noel Thomas. All rights reserved.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    @State private var offset = CGSize.zero
    @State private var rotation = 0
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.white)
                .shadow(radius: 10)
            
            VStack{
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
                
                Text(card.answer)
                    .font(.title)
                    .foregroundColor(Color.gray)
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width:  UIScreen.main.bounds.width - 10, height: 600)
        .rotationEffect(.degrees(Double(self.rotation)))
        .offset(x: offset.width, y: 0)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                    self.rotation = 3
                }
                .onEnded{_ in
                    if abs(self.offset.width) < -100{
                        self.offset = .init(width: -345, height: 0)
                        self.rotation = 0
                    }
                    else{
                        self.offset = .zero
                    }
                    
                    if self.offset == .zero {
                        self.rotation = 0
                    }
                }
        )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}

