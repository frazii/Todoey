//
//  ViewController.swift
//  Todoey
//
//  Created by Fraz Anjum on 10/16/18.
//  Copyright © 2018 Fraz Anjum. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    //var itemsArray = ["Buy Milk","Eat Mangoes","Watch Tutorial"]
    var itemsArray = [item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var newitem1 = item()
        newitem1.name = "Find Milk"
        itemsArray.append(newitem1)
        
        var newitem2 = item()
        newitem2.name = "Recharge SIM"
        itemsArray.append(newitem2)
        
        var newitem3 = item()
        newitem3.name = "Finish tutorial"
        itemsArray.append(newitem3)
        
        
        /*
        if let items = defaults.array(forKey: "ToDoListArray") as? [String]
        {
            itemsArray = items
        }
        */
        
    }


    //MARK - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemsArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("cellforRowAt \(indexPath.row)")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemsArray[indexPath.row]
        cell.textLabel?.text = item.name
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
        
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemsArray[indexPath.row].done = !itemsArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add button  Method
    
    
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New task", message: nil, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            print("add button pressed")
            
            var newitem = item()
            newitem.name = textField.text!
            self.itemsArray.append(newitem)
            
            //self.defaults.set(self.itemsArray, forKey: "ToDoListArray")
            
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create a new item"
            textField = alertTextField
           // print(textField.text)
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil )
        
        
    }
    
}

