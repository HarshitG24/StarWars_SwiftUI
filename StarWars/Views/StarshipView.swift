//
//  StarshipView.swift
//  StarWars
//
//  Created by Harshit Gajjar on 5/28/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import SwiftUI

struct StarshipView: View {
    
    @State var starshipURL : [URL]? = []
    @State var count = 0
    @State var starshipData: [Starship] = []
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
//            Image("s1")
//            .resizable()
//            .edgesIgnoringSafeArea(.all)
            
            LinearGradient(gradient: .init(colors: [Color(UIColor(red: 0.51, green: 0.20, blue: 0.44, alpha: 1.00)),Color(UIColor(red: 0.71, green: 0.20, blue: 0.44, alpha: 1.00))]), startPoint: .top, endPoint: .bottom)
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
            
            PropertyTitle(txt: "Starships")
            
        VStack{
            ZStack{
                BackgroundPanel(height: 480)
                
                self.starshipData.count > 0 ?
                VStack{
                PanelData(title: "Name: ", value: self.starshipData[self.count].name)
                PanelData(title: "Model: ", value: self.starshipData[self.count].model)
                PanelData(title: "Maker: ", value: self.starshipData[self.count].manufacturer)
                PanelData(title: "Hyperdrive: ", value: self.starshipData[self.count].hyperdrive_rating)
                PanelData(title: "Cost: ", value: self.starshipData[self.count].cost_in_credits)
                PanelData(title: "Length: ", value: self.starshipData[self.count].length)
                PanelData(title: "Speed: ", value: self.starshipData[self.count].max_atmosphering_speed)
                PanelData(title: "Crew: ", value: self.starshipData[self.count].crew)
                PanelData(title: "Passengers: ", value: self.starshipData[self.count].passengers)
                VStack{
                    PanelData(title: "MGLT: ", value: self.starshipData[self.count].MGLT)
                    PanelData(title: "Starship_Class: ", value: self.starshipData[self.count].starship_class)
                }
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
                
                (self.count + 1) != self.starshipData.count ? Button(action:{
                    self.count += 1
                }){
                    Text("Next")
                    } : nil
            }.foregroundColor(Color.black)
            .padding([.bottom, .horizontal], 20)
        }
            }.onAppear(perform: loadData)
        .navigationBarTitle("", displayMode: .automatic)
        .navigationBarHidden(true)
    }
    
    func loadData(){
        
        for url in self.starshipURL!{
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request){data, response, error in
                
                guard let data = data else {return}
                
                if let starshipData = try? JSONDecoder().decode(Starship.self, from: data){
                    DispatchQueue.main.async {
                        self.starshipData.append(starshipData)
                    }
                }
            }.resume()
        }
    }
}

struct StarshipView_Previews: PreviewProvider {
    static var previews: some View {
        StarshipView()
    }
}
