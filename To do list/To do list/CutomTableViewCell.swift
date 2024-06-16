//
//  CutomTableViewCell.swift
//  To do list
//
//  Created by user228347 on 6/16/24.
//

import UIKit

class CutomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var label: UILabel!
    
    func set(title:String){
        label.text = title
        updateLabel()
    }
    
    func updateLabel(){
        let atributeString = NSMutableAttributedString(string: label.text!)
    }
    

}
