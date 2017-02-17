//
//  ShoppingListCellTableViewCell.swift
//  ShoppingListCoreData
//
//  Created by Taylor Phillips on 2/17/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit
import CoreData
class ShoppingListCellTableViewCell: UITableViewCell {
    
    weak var delegate: IsGotButtonShoppingListCellDelegate?

    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var isGotButton: UIButton!
    
    @IBAction func isGotButtonTapped(_ sender: UIButton) {
        delegate?.isGotButtonTapped(sender: self)
    }
    
    var shopping: Shopping? {
        didSet{
            updatViews()
        }
    }
    
    func updatViews(){
        guard let shopping = shopping else {return itemNameLabel.text = ""}
        itemNameLabel.text = shopping.itemName
        
        let isGotImage = shopping.isGot ? #imageLiteral(resourceName: "complete") : #imageLiteral(resourceName: "incomplete")
        isGotButton.setImage(isGotImage, for: .normal)
    }
    
}
protocol IsGotButtonShoppingListCellDelegate: class {
    func isGotButtonTapped(sender: ShoppingListCellTableViewCell)
}
