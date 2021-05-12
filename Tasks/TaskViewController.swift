//
//  TaskViewController.swift
//  Tasks
//
//  Created by user196873 on 5/12/21.
//

import UIKit


class TaskViewControler: UIViewController {
    
    @IBOutlet var label : UILabel!
    
    var task: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
        
    }
    
    @objc func deleteTask(){
      //  let newCount = count-1
       // UserDefaults().setValue(newCount, forKey: "count")
       // UserDefaults().setValue(nil, forKey: "task.\(currentPosition)")
    }
}

extension TaskViewControler: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()
        return true
    }
    
    @IBAction func saveTask(){
        
    }
}
