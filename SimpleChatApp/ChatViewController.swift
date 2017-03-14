//
//  ChatViewController.swift
//  SimpleChatApp
//
//  Created by Pushpam Group on 13/03/17.
//  Copyright © 2017 Pushpam Group. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UITextViewDelegate{
    
    @IBOutlet var chatTableView: UITableView!
    @IBOutlet var messageTextView: UITextView!
    
    var chatMessage:String?
    var chatMessageArray:[String] = []
    var messageSent:Bool = false
    
    var chatMessageRowsCount:Int? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    // MARK: UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return chatMessageArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatMessageTableCell", for: indexPath) as! ChatMessageTableCell
        
        let alternateElement = indexPath.row%2
        
        print("indexPath.row type : \(indexPath.row%2)")
        
        switch indexPath.row%2 {
        case 0:
            print(indexPath.row%2)
            cell.chatOpponentTextView.isHidden =  true
            cell.chatMessageTextView.isHidden =  false
            cell.chatMessageTextView.text = "EVEN"
            
        case 1:
            print(indexPath.row%2)
            cell.chatOpponentTextView.isHidden =  false
            cell.chatMessageTextView.isHidden =  true
            cell.chatOpponentTextView.text = "ODD"
        default:
            break
        }
        
//        switch messageSent {
//        case false:
//            cell.chatMessageTextView.isHidden =  true
//            cell.chatOpponentTextView.isHidden =  false
//            cell.chatOpponentTextView.text =  chatMessageArray.last
//        case true:
//            cell.chatMessageTextView.isHidden =  false
//            cell.chatOpponentTextView.isHidden =  true
//            cell.chatOpponentTextView.text =  chatMessageArray.last
//        default:
//            break
//        }
        return cell
    }
    
    //TextView
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
    func textViewDidChange(_ textView: UITextView) {
        chatMessage = textView.text
    }
    
    @IBAction func sendChatMessage(_ sender: Any) {
        
        chatMessageArray.append(chatMessage!)        
        let randomNo = arc4random_uniform(2) == 0
        //print(randomNo)
        
        switch randomNo {
        case false:
           // print(" random True")
            messageSent =  false
            
        case true:
            //print(" random False")
            messageSent = true
        default:
            break
        }
        chatTableView.reloadData()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
