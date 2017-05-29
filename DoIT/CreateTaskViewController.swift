//
//  CreateTaskViewController.swift
//  DoIT
//
//  Created by Jordan Stephenson on 5/29/17.
//  Copyright © 2017 JordansEmoji. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var importantSwitchTask: UISwitch!
    
    var previousVC = TasksViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
        let task = Task()
        task.name = taskNameTextField.text!
        task.important = importantSwitchTask.isOn
        
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        
        navigationController?.popViewController(animated: true)
    }
    


}
