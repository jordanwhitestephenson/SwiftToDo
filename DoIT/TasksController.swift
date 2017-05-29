//
//  TasksViewController.swift
//  DoIT
//
//  Created by Jordan Stephenson on 5/29/17.
//  Copyright © 2017 JordansEmoji. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    //FETCH EVERYTHING OUT OF CORE DATA//
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
          tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        }
        catch {
           print("HOUSTON WE HAVE A PROBLEM")
        }
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "addSegue" {
////            let nextVC = segue.destination as! CreateTaskViewController
////            nextVC.previousVC = self
//        }
        
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self

            
        }
        
    }
    var tasks : [Task] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tasks = makeTasks()
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(task.name)"
        }
        else {
        cell.textLabel?.text = task.name
        }
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
        
    }
//    func makeTasks() -> [Task] {
//        let task1 = Task()
//        task1.name = "Walk the dog"
//        task1.important = false
//        
//        let task2 = Task()
//        task2.name = "Buy The Cheese"
//        task2.important = true
//        
//        let task3 = Task()
//        task3.name = "Mow the lawn"
//        task3.important = false
//        
//        return [task1, task2, task3]
//    }



}

