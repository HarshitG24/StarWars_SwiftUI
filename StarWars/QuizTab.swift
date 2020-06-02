//
//  QuizTab.swift
//  StarWars
//
//  Created by Harshit Gajjar on 6/2/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import SwiftUI

struct QuizTab: View {
    var body: some View {
        NavigationView{
            ZStack{
                Image("10")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    Spacer()
                    Image("squiz")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    NavigationLink(destination: QuizView()) {
                        VStack {
                            Text("Test your knowledge")
                                .foregroundColor(Color.white)
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                            ZStack{
                               RoundedRectangle(cornerRadius: 20)
                                .fill(Color.yellow)
                                .frame(width: 150, height: 50, alignment: .center)
                                
                                 Text("Take Quiz")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                            }
                        }
                    }
                    Spacer()
                }.padding(.horizontal, 30)
            }
            .navigationBarTitle("SW Quiz", displayMode: .inline)
        }.accentColor(Color.black)
    }
}

struct QuizTab_Previews: PreviewProvider {
    static var previews: some View {
        QuizTab()
    }
}
