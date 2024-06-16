//
//  CustonTableViewCell.swift
//  To do list
//
//  Created by user228347 on 6/16/24.
//

import UIKit

class CustonTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    
    func set(title:String){
        label.text = title
    }

}
