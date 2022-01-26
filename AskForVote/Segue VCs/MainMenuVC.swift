//
//  ViewController.swift
//  AskForVote
//
//  Created by 정지원 on 2022/01/19.
//

import UIKit

//추후 서버에서 받아올 정보들 :

var imgSelected = UIImage(named: "EmptyProfileIcon.png") //해당 계정의 프로필 이미지(b.e)
var userName : String = "USERNAME" // 해당 ID의 유저명(b.e)
var isLogin : Bool = false // 로그인 상태 (실제 전역변수 지정)
var serverID = "test" // 서버에 사용자가 입력한 ID가 있는지 읽어옴(b.e)
var serverPW = "test" // 서버의 ID의 비밀번호와 일치하는지 확인함

//여기까지

class MainMenuVC: UIViewController {
    
    var testImage = UIImage(named: "EmptyProfileIcon")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnViewProfile(_ sender: UIBarButtonItem) {
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

