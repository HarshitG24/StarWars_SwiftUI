//
//  FilmView.swift
//  StarWars
//
//  Created by Harshit Gajjar on 5/28/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import SwiftUI

struct SpeciesView: View {
    @State var speciesURL: [URL]? = []
    @State var speciesData: [Species] = []
    @State var count = 0
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack{
             Image("w3")
            .resizable()
                
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Button(action:{
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "arrow.left")
                        .resizable()
                            .foregroundColor(Color.white)
                        .frame(width: 20, height: 20)
                        .padding([.leading, .top], 30)
                    }
                    Spacer()
                }
                
                PropertyTitle(txt: "Species")
                
                VStack{
                    ZStack{
                        BackgroundPanel(height: 315)
                        
    self.speciesData.count > 0 ?
        VStack{
            PanelData(title: "Name: ", value: self.speciesData[self.count].name)
            PanelData(title: "Classification: ", value: self.speciesData[self.count].classification)
             PanelData(title: "Designaton: ", value: self.speciesData[self.count].designation)
            PanelData(title: "Average_Height: ", value: self.speciesData[self.count].average_height)
            PanelData(title: "Skin Color: ", value: self.speciesData[self.count].skin_colors)
            PanelData(title: "Hair Color: ", value: self.speciesData[self.count].hair_colors)
            PanelData(title: "Eye Color: ", value: self.speciesData[self.count].eye_colors)
          
        }: nil
    }
                }
                Spacer()
                
                HStack {
                    self.count != 0 ? Button(action:{
                        self.count -= 1
                    }){
                        Text("Previous")
                        } : nil
                    
                    Spacer()
                    
                    (self.count + 1) != self.speciesData.count ? Button(action:{
                        self.count += 1
                    }){
                        Text("Next")
                        } : nil
                }.padding([.bottom, .horizontal], 20)
            }
            
            }.onAppear(perform: loadData)
            .navigationBarTitle("", displayMode: .automatic)
        .navigationBarHidden(true)
    }
    
     func loadData(){
        
        for url in self.speciesURL!{
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request){data, response, error in
                guard let data = data else {return}
                
                if let data2 = try? JSONDecoder().decode(Species.self, from: data){
                    DispatchQueue.main.async {
                        self.speciesData.append(data2)
                    }
                }
            }.resume()
        }
    }
}

struct FilmView_Previews: PreviewProvider {
    static var previews: some View {
        SpeciesView()
    }
}
