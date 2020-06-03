//
//  QuizView.swift
//  StarWars
//
//  Created by Harshit Gajjar on 6/2/20.
//  Copyright © 2020 ThinkX. All rights reserved.
//

import SwiftUI

struct QuizView: View {
    
   // @ObservedObject var quiz = QuizVC()
    @State var ques: [Quiz] = []
    @State var count = 0
    @State var myScore = 0
    @State var btnselected = 5
    
    var body: some View {
        ZStack{
            Color(UIColor(red: 0.13, green: 0.16, blue: 0.28, alpha: 1.00))
            
            VStack{
                if self.count != 5{
                    HStack {
                        Text("Question \(count + 1)")
                            .font(.system(size: 30))
                            .fontWeight(.heavy)
                        Spacer()
                    } .foregroundColor(Color(UIColor(red: 0.56, green: 0.60, blue: 0.76, alpha: 1.00)))
                }
                
//                Path{ path in
//                    path.move(to: CGPoint(x: 5, y: 0))
//                    path.addLine(to: CGPoint(x: 350, y: 0))
//                }
//                .stroke(style: StrokeStyle( lineWidth: 1, dash: [5]))
//                .foregroundColor(Color(UIColor(red: 0.56, green: 0.60, blue: 0.76, alpha: 1.00)))
                
    if self.ques.count == 5{
        
        if self.count != 5{
            ShowQuizQuestions(arr: self.ques[self.count], btnselected: $btnselected, myScore: $myScore)
            
            Spacer()
            Button(action:{
                self.count += 1
             //   self.checkAnswer()
                self.btnselected = 5
            }){
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                        .frame(width: 120, height: 50, alignment: .center)
                    
                    Text("Next")
                        .foregroundColor(Color.white)
                }
            }.padding(.bottom, 40)
            
        }else{
            QuizResults(score: "\(self.myScore)/5", performance: self.myGrade())
        }
    }
                
                
                
               // Spacer()
            }.padding(.horizontal, 20)
                .padding(.top, 20)
        }
    .onAppear(perform: downloadQuestion)
        .navigationBarTitle("", displayMode: .automatic)
    }
    
    func downloadQuestion(){
        for _ in 0...4{
            DispatchQueue.main.async {
                self.ques.append(quizQuestions[Int.random(in: 0..<quizQuestions.count)])
            }
        }
    }
    
//    func checkAnswer(){
//        if self.count != 5{
//            if self.btnselected == self.ques[self.count].correctOption{
//                self.myScore += 1
//            }
//        }
//    }
    
    func myGrade() -> String{
        let score = self.myScore
        switch score {
        case 5:
            return "Excellent"
            
        case 4:
            return "Good"
            
        case 3:
            return "Satisfactory"
            
        case 2:
            return "Poor"
            
        case 1:
            return "Fail"
            
        default:
            return "Fail"
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}

struct ShowQuizQuestions: View {
    var arr: Quiz
    var myAns = 5
    @Binding var btnselected: Int
    @Binding var myScore: Int
    var body: some View {
        
        VStack{
            HStack {
                Text(self.arr.question)
                    .foregroundColor(Color.white)
                    .font(.system(size: 26))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
            
            VStack(alignment: .leading){
                Button(action:{
                    self.btnselected = 1
                    self.checkAnswer()
                }){
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                        .fill(self.btnselected == 1 ? Color.green : Color.clear)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(COLOR5), lineWidth: 4))
                            .frame(width: UIScreen.main.bounds.width - 40, height: 50, alignment: .center)
                        
                        OptionAns(txt: arr.option1)
                    }
                }.padding(.top, 10)
                
                Button(action:{
                    self.btnselected = 2
                    self.checkAnswer()
                }){
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                        .fill(self.btnselected == 2 ? Color.green : Color.clear)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 50, alignment: .center)
                         .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(COLOR5), lineWidth: 4))
                        
                        OptionAns(txt: arr.option2)
                    }
                }.padding(.top, 10)
                
                Button(action:{
                    self.btnselected = 3
                   self.checkAnswer()
                }){
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                        .fill(self.btnselected == 3 ? Color.green : Color.clear)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 50, alignment: .center)
                             .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(COLOR5), lineWidth: 4))
                        
                        OptionAns(txt: arr.option3)
                    }
                }.padding(.top, 10)
                
                Button(action:{
                    self.btnselected = 4
                    self.checkAnswer()
                }){
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(self.btnselected == 4 ? Color.green : Color.clear)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 50, alignment: .center)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(COLOR5), lineWidth: 4))
                        
                          //  .border(Color.black, width: 2)
                        
                        OptionAns(txt: arr.option4)
                    }
                }.padding(.top, 10)
            }
            
          
        }
        .padding([.top, .bottom], 30)
            
        }
    
    func checkAnswer(){
        if self.btnselected == arr.correctOption{
           
            self.myScore += 1
        }
    }
}


struct QOptions: View {
    var btnSelected = 5
    var body: some View {
        VStack {
            Button(action:{
                
            }){
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.clear)
            }
        }
    }
}

struct OptionAns: View {
    var txt: String
    var body: some View {
        HStack {
            Text(txt)
                .foregroundColor(Color.white)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
                .padding(.leading, 20)
            
            Spacer()
        }
    }
}

struct QuizResults: View {
    var score: String
    var performance: String
    var body: some View {
        VStack{
            Text("Quiz Results")
                .foregroundColor(Color.white)
                .font(.title)
                .fontWeight(.bold)
                .padding()
            Image("winner")
                .resizable()
                .scaledToFit()
                .frame(height: 300)
            
            Text("Congratulations!")
                .foregroundColor(Color.white)
                .font(.system(size: 22))
                .fontWeight(.bold)
                .padding(.top, 10)
            
            Text("Your Score")
                .foregroundColor(Color.gray)
                .font(.system(size: 16))
                .fontWeight(.bold)
                .padding([.top, .bottom], 10)
            
            Text(score)
                .foregroundColor(Color.green)
                .font(.system(size: 22))
                .fontWeight(.bold)
            
            Text("Your quiz performance is: \(performance)")
                .foregroundColor(Color.white)
                .font(.system(size: 20))
                .fontWeight(.medium)
                .padding(.top, 20)
            
            //Spacer()
        }
    }
}
