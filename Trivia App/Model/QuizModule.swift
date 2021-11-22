//
//  QuizModule.swift
//  Trivia App
//
//  Created by iMac on 20/11/21.
//

import Foundation

// This model is used for multiple questions
class QuizModel : NSObject {
    var questaion : String = ""
    var options: [String] = []
    var multipleSelection: Bool = false
    
    init(que:String,options:[String],multiSelection:Bool){
        self.questaion = que
        self.options = options
        self.multipleSelection = multiSelection
    }
}
