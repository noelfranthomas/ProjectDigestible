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
        ScrollView{
            ZCardView()
            
        }
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
            }
            .frame(width: UIScreen.main.bounds.width) //Removes weird side spacing from ScrollView
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
                    
                    .clipped()
                    //.if(click) { $0.position(CGPoint(x: UIScreen.main.bounds.width*0.5, y:UIScreen.main.bounds.height*0.5))}
                    .shadow(radius: self.click ? 5 : 0, x: self.click ? 10 : 0, y: self.click ? 10 : 0)
                    .rotationEffect(Angle(degrees: Double(self.angle)))
                    .offset(x: self.click ? self.offset.width : .zero, y: self.click ? self.offset.height : .zero)
                    .gesture(self.click ? drag : nil)
                    .cornerRadius(10)
                    .animation(.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 0))
                    .onTapGesture {
                        if self.offset.width == 0 {
                            self.click.toggle()
                        }
                    }
        }
    }
}

extension View {
    func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> TupleView<(Self?, Content?)> {
        if conditional { return TupleView((nil, content(self))) }
        else { return TupleView((self, nil)) }
    }
}



struct SCardView : View {
    
    @State private var offset: CGSize = .zero
    
    var body : some View{
        let drag = DragGesture()
            .onChanged{ self.offset = $0.translation}
            .onEnded{
                if $0.translation.width < -150 {
                    self.offset = .zero
                    print("Swiped left")
                }
                else if $0.translation.width > 150 {
                    self.offset = .init(width: -1000, height: 0)
                    print("Swiped right")
                }
                else{
                    self.offset = .zero
                }
        }
        
        return ZStack{
            Rectangle()
                .fill(Color.green)
                .frame(width:300, height: 500)
                .cornerRadius(30)
                .offset(x: -5, y: 5)
            
            Rectangle()
                .fill(Color.red)
                .frame(width:300, height: 500)
                .cornerRadius(30)
                .offset(x: offset.width, y: offset.height)
                .gesture(drag)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
            
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
