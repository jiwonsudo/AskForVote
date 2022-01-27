//
//  LoginVC.swift
//  AskForVote
//
//  Created by 정지원 on 2022/01/20.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet var lblLoginAlert: UILabel!
    @IBOutlet var tfID: UITextField!
    @IBOutlet var tfPW: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true)
    }
    @IBAction func btnLogin(_ sender: UIButton) {
        let inputID = tfID.text ?? ""
        let inputPW = tfPW.text ?? ""
        
        serverID = "test" //TESTCODE 로그인용
        serverPW = "test" //TESTCODE 로그인용
        
        if (inputID == serverID) && (inputPW == serverPW) {
            isLogin = true // isLogin을 true로 변경
            userName = inputID // userName을 입력된 ID로 변경
            lblLoginAlert.text = "로그인에 성공했습니다. 메인화면으로 이동합니다."
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.7) {
                self.presentingViewController?.dismiss(animated: true)
            }
        } else {
            lblLoginAlert.text = "ID 또는 비밀번호가 틀렸습니다."
        }
    }
}

