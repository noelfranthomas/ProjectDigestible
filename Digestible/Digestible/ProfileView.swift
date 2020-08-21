//
//  ProfileView.swift
//  DigestibleApp
//
//  Created by Noel Thomas on 2020-08-19.
//  Copyright © 2020 Noel Thomas. All rights reserved.
//

import SwiftUI

struct ProfileView : View {
    var body: some View{
        VStack(spacing: 0){
                        
            HStack(alignment: .top, spacing: 0){
                Image("Tim")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                    .padding()
                            
                VStack(alignment: .leading) {
                    Text("Tim Cook")
                        .font(.title)
                        .bold()
                    
                    Text("CEO. Philanthropist. All around nice guy.").padding(5)
                }
                .foregroundColor(Color.white)
                .padding(.vertical)
                
                Spacer()

            }
            .frame(width: UIScreen.main.bounds.width - 40)
            .background(Color("LightGray"))
            .cornerRadius(10)
            .padding()
            
            Spacer()

            HStack{
                
                Spacer()
                
                Image(systemName: "creditcard").foregroundColor(Color.white).font(Font.title.weight(.bold))
                
                Spacer()
                
                Image(systemName: "eyeglasses").foregroundColor(Color.white).font(Font.title.weight(.bold))
                
                Spacer()
                
                Image(systemName: "bookmark").foregroundColor(Color.white).font(Font.title.weight(.bold))

                Spacer()

            }
                .frame(width: UIScreen.main.bounds.width, height: 50)
                .background(Color("LightGray"))

            ContributionView()
        }.edgesIgnoringSafeArea(.bottom)
    }
}




struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
