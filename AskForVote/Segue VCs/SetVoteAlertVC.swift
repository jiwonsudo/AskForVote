//
//  SetVoteAlertVC.swift
//  AskForVote
//
//  Created by 정지원 on 2022/01/28.
//

import UIKit

var numToAlert = 10 // 서버로 넘겨줄 알림 설정 수 정보
var setVoteAlert = false // 서버로 넘겨줄 알림 설정 여부 정보

class SetVoteAlertVC: UIViewController {

    @IBOutlet var viewLabelborder: UIView!
    @IBOutlet var tfNumToChange: UITextField!
    @IBOutlet var lblNumToAlert: UILabel!
    @IBOutlet var viewSetVoteAlert: UIView!
    @IBOutlet var switchVoteAlert: UISwitch!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLabelborder.layer.borderWidth = 2
        viewLabelborder.layer.borderColor = UIColor.systemGray5.cgColor
        viewLabelborder.layer.cornerRadius = 10
        
        viewSetVoteAlert.layer.cornerRadius = 15
        
        if setVoteAlert == true {
            switchVoteAlert.setOn(true, animated: false)
            lblNumToAlert.text = String(numToAlert)
        } else {
            switchVoteAlert.setOn(false, animated: false)
            lblNumToAlert.text = "꺼짐"
        }
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func switchVoteAlert(_ sender: UISwitch) {
        if sender.isOn {
            setVoteAlert = true
            lblNumToAlert.text = String(numToAlert)
        } else {
            setVoteAlert = false
            lblNumToAlert.text = "꺼짐"
        }
    }
    
    @IBAction func btnChangeNum(_ sender: UIButton) {
        
        let actionOK = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: {(action) in} )
        
        if setVoteAlert == true && tfNumToChange.text != "" {
            if Int(tfNumToChange.text ?? "") ?? 0 <= 500 && Int(tfNumToChange.text ?? "") ?? 0 > 0  {
                numToAlert = Int(tfNumToChange.text ?? "") ?? 0
                lblNumToAlert.text = String(numToAlert)
                tfNumToChange.text = ""
                
                let alertSetSucess = UIAlertController(title: "알림", message: "성공적으로 반영되었습니다.", preferredStyle: .alert)
                alertSetSucess.addAction(actionOK)
                present(alertSetSucess, animated: true, completion: nil)
            } else if Int(tfNumToChange.text ?? "") ?? 0 == 0 {
                numToAlert = 0
                lblNumToAlert.text = "꺼짐"
                tfNumToChange.text = ""
                setVoteAlert = false
                switchVoteAlert.setOn(false, animated: false)
                
                let alertZeroOrChar = UIAlertController(title: "경고", message: "입력창에 0 또는 숫자가 입력되어 알림이 '꺼짐'으로 설정되었습니다. 올바르게 입력해 주십시오.", preferredStyle: UIAlertController.Style.alert)
                alertZeroOrChar.addAction(actionOK)
                present(alertZeroOrChar, animated: true, completion: nil)
            } else {
                let alertNumToBig = UIAlertController(title: "경고", message: "변경할 수가 너무 큽니다. 알림을 받으시려면 1 ~ 500 사이의 수를 입력하세요.", preferredStyle: UIAlertController.Style.alert)
                alertNumToBig.addAction(actionOK)
                present(alertNumToBig, animated: true, completion: nil)
            }
        } else if setVoteAlert == true && tfNumToChange.text == "" {
            let alertFieldEmpty = UIAlertController(title: "경고", message: "입력창이 빈 상태입니다. 숫자를 입력하고 '변경' 버튼을 누르십시오.", preferredStyle: .alert)
            alertFieldEmpty.addAction(actionOK)
            present(alertFieldEmpty, animated: true, completion: nil)
        } else {
            let alertOffAlert = UIAlertController(title: "경고", message: "투표 수 알림이 꺼져 있습니다. 투표 수를 설정하려면 투표 수 알림을 켠 상태로 설정하십시오.", preferredStyle: UIAlertController.Style.alert)
            alertOffAlert.addAction(actionOK)
            present(alertOffAlert, animated: true, completion: nil)
        }
    }
    
}
