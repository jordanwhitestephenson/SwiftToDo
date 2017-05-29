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
    
//    var previousVC = TasksViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
        //CREATE A TASK FROM THE OUTLET INFORMATION//
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        task.name = taskNameTextField.text!
        task.important = importantSwitchTask.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //POP BACK
        navigationController?.popViewController(animated: true)
    }
    


}
