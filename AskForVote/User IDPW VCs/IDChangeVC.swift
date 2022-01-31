//
//  IDChangeVC.swift
//  AskForVote
//
//  Created by 정지원 on 2022/01/31.
//

import UIKit

class IDChangeVC: UIViewController, UITextFieldDelegate {

    @IBOutlet var lblIDCheck: UILabel!
    @IBOutlet var tfIDtoChange: UITextField!
    @IBOutlet weak var imgViewIDCheck: UIImageView!
    
    var isIDAvailable = false
    var isIDModified = false
    let maxIDLength = 20
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfIDtoChange.text = loginedID
        
        imgViewIDCheck.image = UIImage(systemName: "xmark.square")

        self.tfIDtoChange.delegate = self
    }
    
    func IDCheck(ID : String?) -> Bool { // ID 입력 정규식에 맞는지 체크
        guard ID != nil else { return false }
        let IDReg = "[a-z0-9_]{4,20}" // ID 정규식
        let pred = NSPredicate(format:"SELF MATCHES %@", IDReg)
        return pred.evaluate(with: ID)
    }
    
    func checkID(textField : UITextField){
        
        if textField == tfIDtoChange {
            let IDField = textField
            if IDCheck(ID: IDField.text) == true && IDField.text != loginedID {
                /*
                 ID가 서버에 있는지 확인 후 lblcheckID와 isIDAvailable 수정,
                 만약 가능할 경우 :
                 (불가능할 경우 아래 else문 갖다 쓰기)
                 */
                lblIDCheck.text = "사용 가능한 ID입니다."
                lblIDCheck.textColor = UIColor.systemGreen
                imgViewIDCheck.image = UIImage(systemName: "checkmark.square")
                imgViewIDCheck.tintColor = UIColor.systemGreen
                isIDAvailable = true
                isIDModified = true
            } else if IDCheck(ID: IDField.text) == false && IDField.text != loginedID {
                lblIDCheck.text = "ID가 조건에 맞지 않습니다. (4~20자리, 영어 소문자, 숫자, 언더바(_) 사용 가능)"
                lblIDCheck.textColor = UIColor.systemRed
                imgViewIDCheck.image = UIImage(systemName: "xmark.square")
                imgViewIDCheck.tintColor = UIColor.systemRed
                isIDAvailable = false
                isIDModified = true
            } else {
                lblIDCheck.text = "4~20자리, 영어 소문자, 숫자, 언더바(_) 사용 가능"
                lblIDCheck.textColor = UIColor.darkGray
                imgViewIDCheck.image = UIImage(systemName: "minus.square")
                imgViewIDCheck.tintColor = UIColor.darkGray
                isIDAvailable = false
                isIDModified = false
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkID(textField: textField)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { // textfield 입력 길이 수 제한

        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92 {
                return true
            }
        }

        guard textField.text!.count < maxIDLength else {
            return false
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnChangeID(_ sender: UIButton) {
        
        let actionOK = UIAlertAction(title: "확인", style: .default) { UIAlertAction in
            self.presentingViewController?.dismiss(animated: true)
        }
        
        if isIDAvailable == true && isIDModified == true {
            
            let modifiedID = tfIDtoChange.text
            /*
             FutureUpdate
             서버의 기존 아이디 modifiedID로 변경
             */
            loginedID = modifiedID!
            
            let successAlert = UIAlertController(title: "변경 성공", message:  "성공적으로 변경되었습니다. \n 새 아이디: \(modifiedID!)", preferredStyle: .alert)
            successAlert.addAction(actionOK)
            present(successAlert, animated: true, completion: nil)
        } else if isIDAvailable == true && isIDModified == false {
            let notModifiedAlert = UIAlertController(title: "사용자명 유지", message: "기존 사용자명을 변경하지 않고 '변경하기'를 누르셨습니다. 사용자명이 유지됩니다.", preferredStyle: .alert)
            notModifiedAlert.addAction(actionOK)
            present(notModifiedAlert, animated: true, completion: nil)
        } else {
            let failedAlert = UIAlertController(title: "경고", message: "사용할 수 없는 사용자명입니다. 다시 입력해 주세요.", preferredStyle: .alert)
            failedAlert.addAction(actionOK)
            present(failedAlert, animated: true, completion: nil)
        }
    }
}

