//
//  ViewController.swift
//  MyChatBot
//
//  Created by Baris Berkin Tasci on 24.12.2020.
//

import UIKit

final class ViewController: UIViewController {
    
    var messages: [MessageData] = []
    var isRightButtonClicked: Bool = false
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var messagesTableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var leftMessageTextfield: UITextField!
    @IBOutlet weak var leftSendButton: UIButton!
    @IBOutlet weak var rightMessageTextfield: UITextField!
    @IBOutlet weak var rightSendButton: UIButton!
    
    // MARK: - LIFE CYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareMessagesTableView()
    }
    
    // MARK: - PREPARE UI
    fileprivate func prepareMessagesTableView() {
        messagesTableView.delegate = self
        messagesTableView.dataSource = self
        messagesTableView.separatorStyle = .none
        
        messagesTableView.register(UINib(nibName: "RightMessageCell", bundle: nil), forCellReuseIdentifier: "RightMessageCell")
        messagesTableView.register(UINib(nibName: "LeftMessageCell", bundle: nil), forCellReuseIdentifier: "LeftMessageCell")
        messagesTableView.register(UINib(nibName: "EmptyCell", bundle: nil), forCellReuseIdentifier: "EmptyCell")
        
        messagesTableView.reloadData()
    }
    
    // MARK: - ACTIONS
    @IBAction func leftSendButtonTouched(_ sender: Any) {
        guard let leftTextFromField = leftMessageTextfield.text else {return}
        if leftTextFromField != "" {
            isRightButtonClicked = false
            messages.append(MessageData(text: leftTextFromField, isRight: false))
            messagesTableView.reloadData()
            messagesTableView.scrollToRow(at: IndexPath(row: messages.count - 1, section: 0), at: .top, animated: true)
            leftMessageTextfield.text = ""
        }
    }
    
    @IBAction func rightSendButtonTouched(_ sender: Any) {
        guard let rightTextFromField = rightMessageTextfield.text else {return}
        if rightTextFromField != "" {
            isRightButtonClicked = true
            messages.append(MessageData(text: rightTextFromField, isRight: true))
            messagesTableView.reloadData()
            messagesTableView.scrollToRow(at: IndexPath(row: messages.count - 1, section: 0), at: .top, animated: true)
            rightMessageTextfield.text = ""
        }
    }
    
}

    // MARK: - TABLEVIEWDATASOURCE METHODS
extension ViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if messages[indexPath.row].isRight {
            let rightCell = tableView.dequeueReusableCell(withIdentifier: "RightMessageCell", for: indexPath) as! RightMessageCell
            rightCell.updateRightMessageCell(by: messages[indexPath.row])
            return rightCell
        } else {
            let leftCell = tableView.dequeueReusableCell(withIdentifier: "LeftMessageCell", for: indexPath) as! LeftMessageCell
            leftCell.updateLeftMessageCell(by: messages[indexPath.row])
            return leftCell
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
}
