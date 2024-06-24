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
        tableView.delegate = self
        let start: [Task] = loadTasks()
        if(start.count > 0){
            self.tasks = start
        }
    }
    
    @IBAction func addButton(_ sender: Any) {
        let alert = UIAlertController(title: "Add a new task", message: "Please fill in the field below with the task.", preferredStyle: .alert)
        
        alert.addTextField { field in
            field.placeholder = "Task"
            field.returnKeyType = .next
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: {_ in
            guard let fields = alert.textFields, fields.count ==  1 else {
                return
            }
            let taskField = fields[0]
            
            guard let task = taskField.text, !task.isEmpty else {
                return
            }

            self.tasks.append(Task(title:task))
            
            saveTasks(self.tasks)
            
            self.tableView.reloadData()
            
           
        }))
        
        present(alert, animated: true)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    
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
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "Complete") { action, view, complete in
            let task = self.tasks[indexPath.row].completeToggled()
            self.tasks[indexPath.row] = task;
            
            self.tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            complete(true)
            
            print("Complete")
            
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveTasks(tasks)
            tableView.endUpdates()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
}
