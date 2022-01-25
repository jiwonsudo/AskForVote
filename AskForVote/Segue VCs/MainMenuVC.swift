//
//  ViewController.swift
//  AskForVote
//
//  Created by 정지원 on 2022/01/19.
//

import UIKit

class MainMenuVC: UIViewController, SendLoginInfoProtocol {
    
    var isLogin : Bool = false
    
    var testImage = UIImage(named: "EmptyProfileIcon")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func sendLoginInfo(loginInfo: Bool) {
        self.isLogin = loginInfo
    }
    
    @IBAction func btnViewProfile(_ sender: UIBarButtonItem) {
        if isLogin == false {
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC else {return}
            nextVC.loginInfoDelegate = self
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
        } else {
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC else {return}
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
        }
    }
    

}

