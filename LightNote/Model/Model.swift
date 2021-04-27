//
//  Model.swift
//  LightNote
//
//  Created by Johyeon Yoon on 2021/04/27.
//

import Foundation

class Note {
    var content: String
    var insertDate: Date
    
    init(content: String){
        self.content = content
        insertDate = Date()
        
    }
    
    static var dummyNoteList = [
        Note(content: "일기"),
        Note(content: "오늘의 계획")
    ]
}
