//
//  QuizVC.swift
//  StarWars
//
//  Created by Harshit Gajjar on 6/2/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import Foundation

class QuizVC: NSObject, ObservableObject{
    @Published var quizdata: [Quiz] = []
    
    override init() {
        super.init()
        self.fetchQuestion()
    }
    
    func fetchQuestion(){
        for _ in 0...5{
            DispatchQueue.main.async {
                 self.quizdata.append(quizQuestions[Int.random(in: 0..<quizQuestions.count)])
            }
        }
    }
}
