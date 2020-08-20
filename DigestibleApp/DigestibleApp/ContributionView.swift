//
//  ContributionView.swift
//  DigestibleApp
//
//  Created by Noel Thomas on 2020-08-19.
//  Copyright © 2020 Noel Thomas. All rights reserved.
//


// The cards on the profile page


import SwiftUI

struct ContributionView: View {
    @State private var offset: CGFloat = 0
    @State private var index = 0
    var cardWidth = UIScreen.main.bounds.width - 100
    
    let toOffset: CGFloat = (UIScreen.main.bounds.width - 100 + 40) - (UIScreen.main.bounds.width - 40 - UIScreen.main.bounds.width + 100)
    
    let users = ["Tim" , "Tim", "Tim"]
    let spacing: CGFloat = 20

    var body: some View {
        VStack(alignment: .leading) {
            Text("My Contributions").font(.title).bold().padding(.bottom).padding(.horizontal).foregroundColor(Color.white)
            
            GeometryReader { geometry in
                return ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 0){
                        ForEach(self.users, id: \.self) { usr in
                             Image(usr)
                                .frame(width: self.cardWidth, height: UIScreen.main.bounds.height * 0.5)
                                .cornerRadius(10)
                                .padding(.leading, self.spacing)
                        }
                    }
                }
                .content.offset(x: self.offset)
                .frame(width: geometry.size.width, alignment: .leading)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            self.offset = value.translation.width - geometry.size.width * CGFloat(self.index)
                        })
                        .onEnded({ value in
                            if -value.predictedEndTranslation.width > geometry.size.width / 2, self.index < self.users.count - 1 {
                                self.index += 1
                            }
                            if value.predictedEndTranslation.width > geometry.size.width / 2, self.index > 0 {
                                self.index -= 1
                            }
                            withAnimation { self.offset = -(self.toOffset) * CGFloat(self.index) }
                        })
                )
            }.frame(height: UIScreen.main.bounds.height * 0.5)
        }.padding(.vertical, 30).background(Color("DarkGray"))
    }
}

struct ContributionView_Previews: PreviewProvider {
    static var previews: some View {
        ContributionView()
    }
}
