//
//  ShoppingController.swift
//  ShoppingListCoreData
//
//  Created by Taylor Phillips on 2/17/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import CoreData

class ShoppingController{
    
    static let sharedController = ShoppingController()
    
    let moc = CoreDataStack.context
    
    func isGotButtonTapped(shopping: Shopping){
        shopping.isGot = !shopping.isGot
        saveToPersistenceStore()
        
    }
    
    //crud
    //create
    func addItem(itemName: String){
        let _ = Shopping(itemName: itemName)
        saveToPersistenceStore()
    }
    //run
    var shoppingArray: [Shopping]{
        let request: NSFetchRequest<Shopping> = Shopping.fetchRequest()
        do{
            return try moc.fetch(request)
        }catch{
            return []
        }
    }

    //delete
    func delete(shopping: Shopping) {
        moc.delete(shopping)
        saveToPersistenceStore()
    }
    //save
    func saveToPersistenceStore(){
        do{
            try moc.save()
        }catch{
            print("Hey fatty, put down the donut and fix this. Your item didn't save to the persistence store.")
        }
    }
}
