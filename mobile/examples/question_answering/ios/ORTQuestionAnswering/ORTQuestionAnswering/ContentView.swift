// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

import SwiftUI

struct ContentView: View {
    @State private var performQA = false
    @State private var userQuestion: String = "From which book did I see a magnificent picture?"
    
    func runOrtQuestionAnswering(userQuestion: String) -> String? {
        do {
            let outputText = try ORTQuestionAnsweringPerformer.performQuestionAnswering(userQuestion)
            return outputText
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
            return nil
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Text("ORTQuestionAnswering").font(.title).bold()
                        .frame(width: 400, height: 80)
                        .border(Color.purple, width: 4)
                        .background(Color.purple)
                    
                    Text("Title: <The Little Prince>").font(.subheadline).frame(width: 350, height: 10, alignment:.leading).padding()
                        .foregroundColor(.yellow)
                    
                    Text("Article: We are introduced to the narrator, a pilot, and his ideas about grown-ups. Once when I was six years old I saw a magnificent picture in a book, called True Stories from Nature, about the primeval forest. It was a picture of a boa constrictor in the act of swallowing an animal. Here is a copy of the drawing.In the book it said: 'Boa constrictors swallow their prey whole, without chewing it. After that they are not able to move, and they sleep through the six months that they need for digestion.'").font(.caption).bold().frame(width: 350, height: 150, alignment:.leading) .padding()
                        .background(.yellow)
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    Text("Enter your question: ").font(.subheadline).frame(width: 350, height: 5, alignment:.leading).padding()
                    TextField("User input: ", text: $userQuestion).font(.subheadline).frame(width: 350, height: 20, alignment:.leading).padding()
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Button("Get Answer!") {
                        performQA.toggle()
                    }
                    
                    if performQA {
                        if let outputAnswerText = runOrtQuestionAnswering(userQuestion: userQuestion) {
                            Text(outputAnswerText).font(.headline).foregroundColor(.red).frame(width: 350, height: 100, alignment: .leading)
                        } else {
                            Text("Unable to perform super resolution. ").frame(width: 350, height: 40, alignment:.leading)
                        }
                    }
                    Spacer()
                }
            }
            .padding()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
