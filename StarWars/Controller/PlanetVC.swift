//
//  PlanetVC.swift
//  StarWars
//
//  Created by Harshit Gajjar on 5/30/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class PlanetVC: NSObject, ObservableObject{
    @Published var myimages: [UIImage] = []
    
    override init() {
        super.init()
        self.downloadImages()
    }
    
    func downloadImages(){
        for url in imgURL{
            let request = URLRequest(url: URL(string: url)!)
            
            URLSession.shared.dataTask(with: request){data, response, error in
                guard let data = data else {return}
                
                if let myimage = UIImage(data: data){
                    DispatchQueue.main.async {
                        withAnimation {
                            self.myimages.append(myimage)
                        }
                    }
                }
            }.resume()
        }
    }
}
