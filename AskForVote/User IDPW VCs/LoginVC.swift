//
//  LoginVC.swift
//  AskForVote
//
//  Created by 정지원 on 2022/01/20.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var lblLoginAlert: UILabel!
    @IBOutlet var tfID: UITextField!
    @IBOutlet var tfPW: UITextField!
    
    let maxTFLength = 20
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tfID.delegate = self
        self.tfPW.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { // textfield 입력 길이 수 제한

        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92 {
                return true
            }
        }

        guard textField.text!.count < maxTFLength else {
            return false
        }
        return true
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true)
    }
    @IBAction func btnLogin(_ sender: UIButton) {
        let inputID = tfID.text ?? ""
        let inputPW = tfPW.text ?? ""
        
        if inputID == "test" && inputPW == "test" { // FutureUpdate 서버에서 inputID와 inputPW가 일치하는 것이 있는지 확인
            isLogin = true
            lblLoginAlert.text = "로그인에 성공했습니다. 메인화면으로 이동합니다."
            /*
             FutureUpdate
             loginedID, loginedPW, loginedSex, loginedAge 변경
             */
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.7) {
                self.presentingViewController?.dismiss(animated: true)
            }
        } else if inputID == "" || inputPW == "" {
            lblLoginAlert.text = "ID 또는 비밀번호 중 하나 이상이 입력되지 않았습니다."
        } else {
            lblLoginAlert.text = "ID 또는 비밀번호가 틀렸습니다."
        }
    }
}

