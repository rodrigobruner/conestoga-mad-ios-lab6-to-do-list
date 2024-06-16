//
//  Task.swift
//  To do list
//
//  Created by user228347 on 6/16/24.
//

import Foundation

struct Task {
    let title: String
    let isComplete: Bool
    
    init(title: String, isComplete:Bool = false) {
        self.title = title
        self.isComplete = isComplete
    }
    
    func completeToggled() -> Task {
        return Task(title: title, isComplete: !isComplete)
    }
}
