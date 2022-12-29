//
//  ViewController.swift
//  NetowrkJSON
//
//  Created by Consultant on 12/29/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var todoTableView: UITableView!
    
    private var todoVM : todoViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.todoTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        todoTableView.dataSource = self
        callToViewModelForUIUpdate()
    }

    func callToViewModelForUIUpdate()
    {
        self.todoVM = todoViewModel()
        self.todoVM.bindTodoViewModelToController = { self.updateDataSource() }
    }
    
    func updateDataSource()
    {
        DispatchQueue.main.async {
            self.todoTableView.dataSource = self
            self.todoTableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todoVM.todoList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let index = todoVM.todoList[indexPath.row]
        cell.textLabel?.text = "Task: \(index.title) Completed: \(index.completed)"
        return cell
    }
    

}

