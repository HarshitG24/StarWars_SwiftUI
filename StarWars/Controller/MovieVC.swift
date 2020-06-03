//
//  MovieVC.swift
//  StarWars
//
//  Created by Harshit Gajjar on 5/30/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class MovieVC: NSObject, ObservableObject{
    @Published var movieimg: [UIImage] = []
    
    override init() {
        super.init()
        self.loadImages()
    }
    
    func loadImages(){
        DispatchQueue.global().async {
            for url in swMovies{
                let request = URLRequest(url: URL(string: url)!)
                
                URLSession.shared.dataTask(with: request){data, response, error in
                    guard let data = data else {return}
                    
                    if let myimage = UIImage(data: data){
                        DispatchQueue.main.async {
                            withAnimation {
                                self.movieimg.append(myimage)
                            }
                        }
                    }
                }.resume()
            }
        }
    }
}
