//
//  ViewController.swift
//  MessageApp
//
//  Created by Berkin KABADAYI on 24.12.2020.
//

import UIKit

final class HomePageVC: UIViewController {
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var firstUserTF: UITextField!
    @IBOutlet weak var secondUserTF: UITextField!
    
    @IBOutlet weak var firstUserButton: UIButton!
    @IBOutlet weak var secondUserButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - PROPERTIES
    
    var messages : [Message] = []
    var isRightButtonClicked : Bool = false
    
    // MARK: - LIFE CYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    // MARK: - PREPARE UI
    
    fileprivate func prepareUI() {
        prepareAllLayers()
        prepareTableView()
    }
    
    fileprivate func prepareTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "TableViewRightCell", bundle: nil), forCellReuseIdentifier: "TableViewRightCell")
        tableView.register(UINib(nibName: "TableViewLeftCell", bundle: nil), forCellReuseIdentifier: "TableViewLeftCell")
        tableView.reloadData()
    }
    
    fileprivate func prepareAllLayers() {
        prepareLayer(object: infoLabel as Any)
        prepareLayer(object: firstUserTF as Any)
        prepareLayer(object: secondUserTF as Any)
        prepareLayer(object: firstUserButton as Any)
        prepareLayer(object: secondUserButton as Any)
        prepareLayer(object: tableView as Any)
        infoLabel.text = " RaveChat \n Easy messaging with your friend!"
    }
    
    fileprivate func prepareLayer(object: Any) {
        if let object = object as? UIControl {
            object.layer.cornerRadius = 15
            object.layer.masksToBounds = true
        } else if let object = object as? UIView {
            object.layer.cornerRadius = 15
            object.layer.masksToBounds = true
        }
    }
    
    // MARK: - ACTIONS
    
    @IBAction func firstUserButtonTouched(_ sender: Any) {
        guard let leftText = firstUserTF.text else {return}
        if leftText != "" {
            isRightButtonClicked = false
            messages.append(Message(message: leftText, isRight: false))
            tableView.reloadData()
            tableView.scrollToRow(at: IndexPath(row: messages.count - 1, section: 0), at: .top, animated: true)
            firstUserTF.text = ""
        }
    }
    
    @IBAction func secondUserButtonTouched(_ sender: Any) {
        guard let rightText = secondUserTF.text else {return}
        if rightText != "" {
            isRightButtonClicked = true
            messages.append(Message(message: rightText, isRight: true))
            tableView.reloadData()
            tableView.scrollToRow(at: IndexPath(row: messages.count - 1, section: 0), at: .top, animated: true)
            secondUserTF.text = ""
        }
    }
}

// MARK: - UITableViewDataSource Methods

extension HomePageVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if messages[indexPath.row].isRight {
            let rightCell = tableView.dequeueReusableCell(withIdentifier: "TableViewRightCell", for: indexPath) as! TableViewRightCell
            rightCell.setRightCell(newMessage: messages[indexPath.row])
            return rightCell
        } else {
            let leftCell = tableView.dequeueReusableCell(withIdentifier: "TableViewLeftCell", for: indexPath) as! TableViewLeftCell
            leftCell.setLeftCell(newMessage: messages[indexPath.row])
            return leftCell
        }
        
    }
}

// MARK: - UITableViewDelegate Methods

extension HomePageVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}






