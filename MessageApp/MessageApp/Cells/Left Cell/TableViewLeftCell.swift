//
//  TableViewLeftCell.swift
//  MessageApp
//
//  Created by Berkin KABADAYI on 25.12.2020.
//

import UIKit

class TableViewLeftCell: UITableViewCell {

    @IBOutlet weak var leftMessageLabel: UILabel!
    @IBOutlet weak var leftMessageLabelView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareLayer(object: leftMessageLabel as Any)
        prepareLayer(object: leftMessageLabelView as Any)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setLeftCell (newMessage: Message) {
        leftMessageLabel.text = newMessage.message + "\n \n" + newMessage.time
    }
    
    func prepareLayer(object: Any) {
        if let object = object as? UIView {
            object.layer.cornerRadius = 7
            object.layer.masksToBounds = true
        }
        
    }
    
}
