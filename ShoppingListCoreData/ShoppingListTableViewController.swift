//
//  ShoppingListTableViewController.swift
//  ShoppingListCoreData
//
//  Created by Taylor Phillips on 2/17/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class ShoppingListTableViewController: UITableViewController, IsGotButtonShoppingListCellDelegate {
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Shopping List", message: "What would you like to add to the shopping list?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        var itemNameTextField: UITextField?
        alertController.addTextField { (textField) in
            itemNameTextField = textField
        }
        let addItemAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let itemName = itemNameTextField?.text else {return}
            ShoppingController.sharedController.addItem(itemName: itemName)
            
            self.tableView.reloadData()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(addItemAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    

    func isGotButtonTapped(sender: ShoppingListCellTableViewCell) {
        guard let shopping = sender.shopping, let indexPath = tableView.indexPath(for: sender) else {return}
        ShoppingController.sharedController.isGotButtonTapped(shopping: shopping)
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
   
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.title = "Shopping List"
            
        }
        
        // MARK: - Table view data source
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return ShoppingController.sharedController.shoppingArray.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingListCell", for: indexPath) as? ShoppingListCellTableViewCell else {return UITableViewCell()}
            let shopping  = ShoppingController.sharedController.shoppingArray[indexPath.row]
            
            cell.shopping = shopping
            cell.delegate = self
            
            return cell
        }
        
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                let shopping = ShoppingController.sharedController.shoppingArray[indexPath.row]
                ShoppingController.sharedController.delete(shopping: shopping)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    
}
