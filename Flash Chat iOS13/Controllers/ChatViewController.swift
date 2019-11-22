//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var message: [Message] = [
        Message(sender: "12@21.com", body: "Hi!"),
        Message(sender: "1@2.com", body: "Hello"),
        Message(sender: "12@21.com", body: "What's up?")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        title = Constants.appName
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    @IBAction func logOutTapped(_ sender: UIBarButtonItem) {
        
        FirebaseManager.logout {(isSuccess) in
            if isSuccess {
                navigationController?.popToRootViewController(animated: true)
            }
            else {
                print("Error")
            }
        }
    }

}

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        cell.textLabel?.text = message[indexPath.row].body
        return cell
    }
    
    
}
