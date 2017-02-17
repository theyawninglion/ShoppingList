//
//  Shopping+convenience.swift
//  ShoppingListCoreData
//
//  Created by Taylor Phillips on 2/17/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import CoreData

extension Shopping{
    @discardableResult convenience init(itemName: String, isGot: Bool = false, context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context:context)
        self.itemName = itemName
        self.isGot = isGot
    }
}
