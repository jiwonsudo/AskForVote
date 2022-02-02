//
//  ResignVC.swift
//  AskForVote
//
//  Created by 정지원 on 2022/01/28.
//

import UIKit

class ResignVC: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var pkViewResignReason: UIPickerView!
    @IBOutlet var tfProblemToFix: UITextField!
    @IBOutlet weak var tfLoginedPWCheck: UITextField!
    @IBOutlet weak var btnGoResign: UIButton!
    @IBOutlet weak var lblLoginedPWCheck: UILabel!
    @IBOutlet weak var imgViewPWCheck: UIImageView!
    
    let resignReason = ["그냥", "인터페이스가 불편해서", "앱의 기능이 쓸모없어서", "악성 유저가 너무 많아서", "기타 이유(아래에 작성)"]
    var userResignReason = "그냥"
    var isagreeToResign = false
    var isLoginedPWCheck = false
    let maxPWLength = 15
    let maxProbLength = 60
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pkViewResignReason.delegate = self
        self.tfLoginedPWCheck.delegate = self
        self.tfProblemToFix.delegate = self
        
        btnGoResign.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        btnGoResign.tintColor = UIColor.systemRed
        
        tfLoginedPWCheck.placeholder = "ID : \(loginedID)의 비밀번호 입력"
        lblLoginedPWCheck.text = ""
        lblLoginedPWCheck.text = "비밀번호를 입력하세요."
        lblLoginedPWCheck.textColor = UIColor.systemGray
        imgViewPWCheck.image = UIImage(systemName: "xmark.square")
        imgViewPWCheck.tintColor = UIColor.systemRed
        isLoginedPWCheck = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkPW(textField: textField)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { // tfLoginedPWCheck 입력 길이 수 제한
        if textField == tfLoginedPWCheck {
            if let char = string.cString(using: String.Encoding.utf8) {
                let isBackSpace = strcmp(char, "\\b")
                if isBackSpace == -92 {
                    return true
                }
            }
            
            guard textField.text!.count < maxPWLength else {
                return false
            }
        } else if textField == tfProblemToFix {
            if let char = string.cString(using: String.Encoding.utf8) {
                let isBackSpace = strcmp(char, "\\b")
                if isBackSpace == -92 {
                    return true
                }
            }
            
            guard textField.text!.count < maxProbLength else {
                return false
            }
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return resignReason.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        userResignReason = resignReason[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return resignReason[row]
    }
    
    func checkPW(textField : UITextField){
        
        if textField == tfLoginedPWCheck {
            let PWDoubleCheckField = textField
            if PWDoubleCheckField.text == loginedPW {
                lblLoginedPWCheck.text = "비밀번호가 동일합니다."
                lblLoginedPWCheck.textColor = UIColor.systemGreen
                imgViewPWCheck.image = UIImage(systemName: "checkmark.square")
                imgViewPWCheck.tintColor = UIColor.systemGreen
                isLoginedPWCheck = true
            } else if PWDoubleCheckField.text == "" {
                lblLoginedPWCheck.text = "비밀번호를 입력하세요."
                lblLoginedPWCheck.textColor = UIColor.systemGray
                imgViewPWCheck.image = UIImage(systemName: "xmark.square")
                imgViewPWCheck.tintColor = UIColor.systemRed
                isLoginedPWCheck = false
            } else if PWDoubleCheckField.text != loginedPW {
                lblLoginedPWCheck.text = "비밀번호가 일치하지 않습니다."
                lblLoginedPWCheck.textColor = UIColor.systemRed
                imgViewPWCheck.image = UIImage(systemName: "xmark.square")
                imgViewPWCheck.tintColor = UIColor.systemRed
                isLoginedPWCheck = false
            }
        }
    }
    
    @IBAction func btnCheckToAgree(_ sender: UIButton) {
        if isagreeToResign == true {
            isagreeToResign = false
            btnGoResign.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            btnGoResign.tintColor = UIColor.systemRed
        } else {
            isagreeToResign = true
            btnGoResign.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            btnGoResign.tintColor = UIColor.systemGreen
        }
    }
    
    @IBAction func btnGoBack(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnGoResign(_ sender: UIButton) {
        
        checkPW(textField: tfLoginedPWCheck)
        
        let actionOK = UIAlertAction(title: "확인", style: .default, handler: nil)
        let actionOKDismiss  = UIAlertAction(title: "확인", style: .default, handler: {(action) in self.presentingViewController?.dismiss(animated: true, completion: nil)
            self.presentingViewController?.dismiss(animated: true, completion: nil)})
        
        if isLoginedPWCheck == true && isagreeToResign == true {
            let successAlert = UIAlertController(title: "탈퇴 완료", message: "떠나신다니 아쉽습니다. 더 좋은 서비스를 위해 노력하겠습니다. 지금까지 이용해주셔서 감사합니다.", preferredStyle: .alert)
            successAlert.addAction(actionOKDismiss)
            present(successAlert, animated: true, completion: nil)
            /*
             FutureUpdate
             userResignReason 서버로 전송
             loginedID, loginedPW에 해당하는 유저명 삭제, 글 삭제
             */
            isLogin = false
            loginedID = ""
            loginedPW = ""
        } else if isLoginedPWCheck == true && isagreeToResign == false {
            let notAgreeAlert = UIAlertController(title: "경고", message: "회원 탈퇴 동의 버튼을 선택하지 않으셨습니다. 버튼을 눌러 확인해 주세요.", preferredStyle: .alert)
            notAgreeAlert.addAction(actionOK)
            present(notAgreeAlert, animated: true, completion: nil)
        } else if isLoginedPWCheck == false && isagreeToResign == true {
            let notPWCheckAlert = UIAlertController(title: "경고", message: "비밀번호가 맞지 않습니다. 다시 입력해주세요.", preferredStyle: .alert)
            notPWCheckAlert.addAction(actionOK)
            tfLoginedPWCheck.text = ""
            tfLoginedPWCheck.placeholder = "ID : \(loginedID)의 비밀번호 입력"
            present(notPWCheckAlert, animated: true, completion: nil)
        } else {
            let notEnteredAlert = UIAlertController(title: "경고", message: "비밀번호 입력과 회원 탈퇴 동의를 먼저 진행해 주세요.", preferredStyle: .alert)
            notEnteredAlert.addAction(actionOK)
            present(notEnteredAlert, animated: true, completion: nil)
        }
    }
    
}
