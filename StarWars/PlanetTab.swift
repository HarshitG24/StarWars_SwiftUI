//
//  History.swift
//  StarWars
//
//  Created by Harshit Gajjar on 5/29/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import SwiftUI

struct PlanetTab: View {
    
   // @State var myimages: [UIImage] = []
    @ObservedObject var planetvc = PlanetVC()
    @State var sheetDisplayed: Bool = false
    @State var selectedIndex: Int = 0
    var body: some View {
        NavigationView{
            ZStack{
                
                Color.black
                VStack{
           if planetvc.myimages.count == 12{
            List{
                ForEach(0...10, id:\.self){i in
                    Image(uiImage: self.planetvc.myimages[i])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .listRowBackground(Color.black)
                    .onTapGesture {
                       self.selectedIndex = i
                       self.sheetDisplayed.toggle()
                    }
                    
                }
            }.accentColor(Color.black)
           }
           Spacer()
       }
       .padding(.horizontal, 10)
           .padding(.top, 15)
           .navigationBarTitle("Planets")
            }
            
        }.sheet(isPresented: $sheetDisplayed){
            PlanetView(img: self.planetvc.myimages[self.selectedIndex], planet: planets[self.selectedIndex])
        }
    }
}

struct PlanetTab_Previews: PreviewProvider {
    static var previews: some View {
        PlanetTab()
    }
}


//               HStack{
//                   ForEach(0...2, id: \.self){i in
//                       Image(uiImage: self.planetvc.myimages[i])
//                       .resizable()
//                       .scaledToFit()
//                       .transition(.scale)
//                       .onTapGesture {
//                           self.selectedIndex = i
//                           self.sheetDisplayed.toggle()
//                       }
//                   }
//               }
//
//               HStack{
//                   ForEach(3...5, id: \.self){i in
//                       Image(uiImage: self.planetvc.myimages[i])
//                       .resizable()
//                       .scaledToFit()
//                       .transition(.scale)
//                       .onTapGesture {
//                           self.selectedIndex = i
//                           self.sheetDisplayed.toggle()
//                       }
//                   }
//               }

//               HStack{
//                   ForEach(6...8, id: \.self){i in
//                       Image(uiImage: self.planetvc.myimages[i])
//                       .resizable()
//                       .scaledToFit()
//                       .transition(.scale)
//                       .onTapGesture {
//                           self.selectedIndex = i
//                           self.sheetDisplayed.toggle()
//                       }
//                   }
//               }
               
//               HStack{
//                   ForEach(9...11, id: \.self){i in
//                       Image(uiImage: self.planetvc.myimages[i])
//                       .resizable()
//                       .scaledToFit()
//                       .transition(.scale)
//                       .onTapGesture {
//                           self.selectedIndex = i
//                           self.sheetDisplayed.toggle()
//                       }
//                   }
//               }
