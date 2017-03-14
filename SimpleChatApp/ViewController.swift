//
//  ViewController.swift
//  SimpleChatApp
//
//  Created by Pushpam Group on 13/03/17.
//  Copyright © 2017 Pushpam Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LGChatControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func startChat(_ sender: Any) {
   
        self.performSegue(withIdentifier: "segueToChatViewController", sender: self)
    }
    @IBAction func startChatUsingLGChat(_ sender: Any) {
        
        let chatController = LGChatController()
        chatController.opponentImage = UIImage(named: "user_icon")
        chatController.title = "Simple Chat"
        let helloWorld = LGChatMessage(content: "Hello World!", sentBy: LGChatMessage.SentBy(rawValue: LGChatMessage.SentByUserString())!)
        chatController.messages = [helloWorld]
        // Pass your messages here.
        chatController.delegate = self
        self.navigationController?.pushViewController(chatController, animated: true)

       
    }
    func chatController(_ chatController: LGChatController, didAddNewMessage message: LGChatMessage) {
        print(message.content)
    }
    func shouldChatController(_ chatController: LGChatController, addMessage message: LGChatMessage) -> Bool {
        
        let randomNo = arc4random_uniform(2) == 0
        print(randomNo)
        
        switch randomNo {
        case false:
            message.sentByString = LGChatMessage.SentByOpponentString()
        case false:
            message.sentByString = LGChatMessage.SentByUserString()
        default:
            break
        }
    
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

