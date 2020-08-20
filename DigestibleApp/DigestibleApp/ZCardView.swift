//
//  ZCardView.swift
//  DigestibleApp
//
//  Created by Noel Thomas on 2020-08-18.
//  Copyright © 2020 Noel Thomas. All rights reserved.
//


// The card stack unit


import SwiftUI

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

struct ZCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZCardView()
    }
}
