//
//  SetVoteAlertVC.swift
//  AskForVote
//
//  Created by 정지원 on 2022/01/28.
//

import UIKit

class SetVoteAlertVC: UIViewController, UITextFieldDelegate {

    @IBOutlet var viewLabelborder: UIView!
    @IBOutlet var tfNumToChange: UITextField!
    @IBOutlet var lblNumToAlert: UILabel!
    @IBOutlet var viewSetVoteAlert: UIView!
    @IBOutlet var switchVoteAlert: UISwitch!
    
    let maxTFLength = 5
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLabelborder.layer.borderWidth = 2
        viewLabelborder.layer.borderColor = UIColor.systemGray5.cgColor
        viewLabelborder.layer.cornerRadius = 10
        
        viewSetVoteAlert.layer.cornerRadius = 15
        
        self.tfNumToChange.delegate = self
        
        if setVoteAlert == true {
            switchVoteAlert.setOn(true, animated: false)
            lblNumToAlert.text = String(numToAlert)
        } else {
            switchVoteAlert.setOn(false, animated: false)
            lblNumToAlert.text = "꺼짐"
        }
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
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func switchVoteAlert(_ sender: UISwitch) {
        if sender.isOn {
            setVoteAlert = true
            lblNumToAlert.text = String(numToAlert)
            /*
             FutureUpdate
             알림 여부(Bool) = true 송신
             */
        } else {
            setVoteAlert = false
            lblNumToAlert.text = "꺼짐"
            /*
             FutureUpdate
             알림 여부(Bool) = false 송신
             */
        }
    }
    
    @IBAction func btnChangeNum(_ sender: UIButton) {
        
        let actionOK = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: {(action) in} )
        
        if setVoteAlert == true && tfNumToChange.text != "" {
            if Int(tfNumToChange.text ?? "") ?? 0 <= 500 && Int(tfNumToChange.text ?? "") ?? 0 > 0  {
                numToAlert = Int(tfNumToChange.text ?? "") ?? 0
                lblNumToAlert.text = String(numToAlert)
                tfNumToChange.text = ""
                
                self.view.endEditing(true)
                /*
                 FutureUpdate
                 서버로 알림 수 = true 송신
                 */
                
                let alertSetSucess = UIAlertController(title: "알림", message: "성공적으로 반영되었습니다.", preferredStyle: .alert)
                alertSetSucess.addAction(actionOK)
                present(alertSetSucess, animated: true, completion: nil)
            } else if Int(tfNumToChange.text ?? "") ?? 0 == 0 {
                numToAlert = 0
                lblNumToAlert.text = "꺼짐"
                tfNumToChange.text = ""
                setVoteAlert = false
                switchVoteAlert.setOn(false, animated: false)
                
                /*
                 FutureUpdate
                 서버로 알림 여부(Bool) = false 송신
                 */
                
                self.view.endEditing(true)
                
                let alertZeroOrChar = UIAlertController(title: "경고", message: "입력창에 0 또는 숫자가 입력되어 알림이 '꺼짐'으로 설정되었습니다. 올바르게 입력해 주십시오.", preferredStyle: UIAlertController.Style.alert)
                alertZeroOrChar.addAction(actionOK)
                present(alertZeroOrChar, animated: true, completion: nil)
            } else {
                self.view.endEditing(true)
                tfNumToChange.text = ""
                let alertNumToBig = UIAlertController(title: "경고", message: "변경할 수가 너무 큽니다. 알림을 받으시려면 1 ~ 500 사이의 수를 입력하세요.", preferredStyle: UIAlertController.Style.alert)
                alertNumToBig.addAction(actionOK)
                present(alertNumToBig, animated: true, completion: nil)
            }
        } else if setVoteAlert == true && tfNumToChange.text == "" {
            self.view.endEditing(true)
            let alertFieldEmpty = UIAlertController(title: "경고", message: "입력창이 빈 상태입니다. 숫자를 입력하고 '변경' 버튼을 누르십시오.", preferredStyle: .alert)
            alertFieldEmpty.addAction(actionOK)
            present(alertFieldEmpty, animated: true, completion: nil)
        } else {
            self.view.endEditing(true)
            tfNumToChange.text = ""
            let alertOffAlert = UIAlertController(title: "경고", message: "투표 수 알림이 꺼져 있습니다. 투표 수를 설정하려면 투표 수 알림을 켠 상태로 설정하십시오.", preferredStyle: UIAlertController.Style.alert)
            alertOffAlert.addAction(actionOK)
            present(alertOffAlert, animated: true, completion: nil)
        }
    }
    
}
