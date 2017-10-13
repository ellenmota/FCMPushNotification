//
//  ViewController.swift
//  Push test
//
//  Created by Ellen Bianca Mota de Carvalho on 09/10/17.
//  Copyright © 2017 Ellen Bianca Mota de Carvalho. All rights reserved.
//

import UIKit
import FirebaseMessaging
import Alamofire

class ViewController: UIViewController {


    @IBOutlet weak var enviarPushBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.enviarPushBtn.layer.cornerRadius = 8
    }


    @IBAction func enviarPush(_ sender: Any) {
        
        var _headers: HTTPHeaders? = HTTPHeaders()
        
        _headers =
        [
            "Content-Type" : "application/json",
            "Authorization" : "key=\(serverKey)"
        ]
        
        let _notification: Parameters? =
        [
            "to" : "\(tokenDeviceFCM)",
            "notification": [
                "body" : "enviou uma mensagem",
                "title": "EllenMota",
                "priority" : "high",
                "badge": "1",
                "sound": "default"
            ]
        ]
        
  
        Alamofire.request("https://fcm.googleapis.com/fcm/send", method: .post, parameters: _notification, encoding: JSONEncoding.default, headers: _headers).responseJSON(completionHandler: {
            (resp) in
            print(resp)
        })
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

