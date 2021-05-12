//
//  ViewController.swift
//  Tasks
//
//  Created by user196873 on 5/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var task = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tasks"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //Setup
        if !UserDefaults().bool(forKey: "setup"){
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
        
        
        
        //Get all current saved task
        updateTasks()

        
    }
    
    @IBAction func addTapItem(){
        let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewControler
        vc.title = "New Task"
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func updateTasks(){
        task.removeAll()
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        for x in 0...count {
            if let tasks = UserDefaults().value(forKey: "task_\(x+1)") as? String{
                task.append(tasks)
            }
            
        }
        tableView.reloadData()
    }
    


}


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "task") as! TaskViewControler
        vc.title = "New Task"
        vc.task = task[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)

    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = task[indexPath.row]
        return cell
    }
    
    
}
