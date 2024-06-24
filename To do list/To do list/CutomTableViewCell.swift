//
//  CutomTableViewCell.swift
//  To do list
//
//  Created by user228347 on 6/16/24.
//

import UIKit

class CutomTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    func set(title:String, isCompleted: Bool = false){
        label.text = title
        updateLabel()
        
    }
    

    func updateLabel(){
        
        //if completed
//        let attributedString = NSMutableAttributedString(string: label.text!)
//        attributedString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length-1))
//        label.attributedText = attributedString

    }
    

}
