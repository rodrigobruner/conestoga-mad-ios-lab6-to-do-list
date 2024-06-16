//
//  ViewController.swift
//  To do list
//
//  Created by user228347 on 6/16/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = [
        Task(title: "Task 1"),
        Task(title: "Task 2"),
        Task(title: "Task 3"),
    ]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    }
}

extension ViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todolist-cell", for: indexPath) as! CutomTableViewCell
        
        let task:Task = tasks[indexPath.row]
        cell.set(title: task.title);
        return cell
    }
    
    
}
