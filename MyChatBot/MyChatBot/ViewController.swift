//
//  ViewController.swift
//  MyChatBot
//
//  Created by Baris Berkin Tasci on 24.12.2020.
//

import UIKit

final class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var rightMessages: [RightMessageData] = []
    
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
        prepareTitleLabel()
        prepareMessagesTableView()
        //rightMessageTextfield.text = nil
    }
    
    // MARK: - PREPARE UI
    fileprivate func prepareMessagesTableView() {
        messagesTableView.delegate = self
        messagesTableView.dataSource = self
        messagesTableView.separatorStyle = .none
        messagesTableView.register(UINib(nibName: "RightMessageCell", bundle: nil), forCellReuseIdentifier: "RightMessageCell")
        messagesTableView.reloadData()
    }
    
    func prepareTitleLabel() {
        titleLabel.layer.backgroundColor = UIColor.systemGray4.cgColor
        titleLabel.textColor = UIColor.systemBlue
        
    }
    
    // MARK: - ACTIONS
    @IBAction func leftSendButtonTouched(_ sender: Any) {
    }
    
    @IBAction func rightSendButtonTouched(_ sender: Any) {
        guard let rightTextFromField = rightMessageTextfield.text else {return}
        if rightTextFromField != "" {
            rightMessages.append(RightMessageData(text: rightTextFromField))
            //messagesTableView.beginUpdates()
            messagesTableView.insertRows(at: [IndexPath.init(row: rightMessages.count - 1, section: 0)], with: .fade)
            //messagesTableView.endUpdates()
            messagesTableView.scrollToRow(at: IndexPath(row: rightMessages.count - 1, section: 0), at: .top, animated: true)
            rightMessageTextfield.text = ""
        }
    }
    
    // MARK: - TABLEVIEW DELEGATE
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rightMessages.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rightCell = tableView.dequeueReusableCell(withIdentifier: "RightMessageCell", for: indexPath) as! RightMessageCell
        rightCell.updateRightMessageCell(by: rightMessages[indexPath.row])
        return rightCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}

