//
//  ViewController.swift
//  AskForVote
//
//  Created by 정지원 on 2022/01/19.
//

import UIKit

class MainMenuVC: UIViewController {
    
    func sendLoginInfo(loginInfo: Bool) {
        if loginInfo == false {
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC else {return}
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
        } else {
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC else {return}
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
        }
    }
    
    var isLogin : Bool = false //로그인 상태 확인
    
    var testImage = UIImage(named: "EmptyProfileIcon")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnViewProfile(_ sender: UIBarButtonItem) {
        let isLogin : Bool = true // 테스트 코드: 초기 로그인 상태
        if isLogin == false {
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC else {return}
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
        } else {
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC else {return}
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
        }
    }
    

}

