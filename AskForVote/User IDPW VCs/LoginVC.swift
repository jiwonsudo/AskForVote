//
//  LoginVC.swift
//  AskForVote
//
//  Created by 정지원 on 2022/01/20.
//

import UIKit

var serverID = ""
var serverPW = ""

class LoginVC: UIViewController {
    
    @IBOutlet var lblLoginAlert: UILabel!
    @IBOutlet var tfID: UITextField!
    @IBOutlet var tfPW: UITextField!
    
    var loginInfoDelegate : SendLoginInfoProtocol?
    
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
        
        if inputID == serverID && inputPW == serverPW {
            loginInfoDelegate?.sendLoginInfo(loginInfo: true)
            userName = inputID // TESTCODE 로그인용
            lblLoginAlert.text = "로그인에 성공했습니다. 메인화면으로 이동합니다."
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.7) {
                self.presentingViewController?.dismiss(animated: true)
            }
        } else if inputID == serverID && inputPW != serverPW {
            lblLoginAlert.text = "비밀번호가 틀렸습니다."
        } else {
            lblLoginAlert.text = "가입되지 않은 ID입니다."
        }
    }
}

protocol SendLoginInfoProtocol {
    func sendLoginInfo(loginInfo : Bool)
}
