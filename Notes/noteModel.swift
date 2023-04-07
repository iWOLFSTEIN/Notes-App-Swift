//
//  DataStorage.swift
//  Notes
//
//  Created by BrainX Technologies on 06/04/2023.
//

import Foundation


struct Notes{
    let heading: String
    let noteBody: String
    let time: Date
    
    init(head heading: String, note noteBody: String, timestamp time: Date){
        self.heading = heading
        self.noteBody = noteBody
        self.time = time
    }
}


var notesList: [Notes] = [Notes]()
