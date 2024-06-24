//
//  Task.swift
//  To do list
//
//  Created by user228347 on 6/16/24.
//

import Foundation

struct Task : Codable{
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


let KeyForUserDefaults = "taskList"

func saveTasks(_ tasks: [Task]) {
    let data = tasks.map { try? JSONEncoder().encode($0) }
    UserDefaults.standard.set(data, forKey: KeyForUserDefaults)
}

func loadTasks() -> [Task] {
    guard let encodedData = UserDefaults.standard.array(forKey: KeyForUserDefaults) as? [Data] else {
        return []
    }

    return encodedData.map { try! JSONDecoder().decode(Task.self, from: $0) }
}
