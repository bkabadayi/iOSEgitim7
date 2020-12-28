//
//  TableViewRightCell.swift
//  MessageApp
//
//  Created by Berkin KABADAYI on 25.12.2020.
//

import UIKit

class TableViewRightCell: UITableViewCell {
    
    @IBOutlet weak var rightMessageLabel: UILabel!
    @IBOutlet weak var rightMessageLabelView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareLayer(object: rightMessageLabel as Any)
        prepareLayer(object: rightMessageLabelView as Any)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setRightCell (newMessage: Message) {
//        let currentDateTime = Date()                        // Class içine yazınca olmuyor.
//        let formatter = DateFormatter()
//        formatter.timeStyle = .medium
//        formatter.dateStyle = .long
//        let dateTimeString = formatter.string(from: currentDateTime)
        rightMessageLabel.text = newMessage.message + "\n \n" + newMessage.time
    }
    
    func prepareLayer(object: Any) {
        if let object = object as? UIView {
            object.layer.cornerRadius = 7
            object.layer.masksToBounds = true
        }
        
    }
}
