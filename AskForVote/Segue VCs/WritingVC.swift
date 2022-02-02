//
//  Writing.swift
//  AskForVote
//
//  Created by 정지원 on 2022/01/20.
//

import UIKit

class WritingVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var viewAnonymousQ: UIView!
    @IBOutlet weak var viewSearchQ: UIView!
    @IBOutlet var tfTitle: UITextField!
    @IBOutlet var tfFirstQ: UITextField!
    @IBOutlet var tfSecondQ: UITextField!
    
    var isAnonymousQ : Bool = false
    var isSearchQ : Bool = true
    var placeHolderText : String = "투표의 제목을 입력하세요.."
    let maxTFLength = 50
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewAnonymousQ.layer.cornerRadius = 15
        viewSearchQ.layer.cornerRadius = 15
        
        self.tfTitle.delegate = self
        self.tfFirstQ.delegate = self
        self.tfSecondQ.delegate = self
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
    
    @IBAction func switchAnonymousQ(_ sender: UISwitch) {
        if sender.isOn {
            isAnonymousQ = true
        } else {
            isAnonymousQ = false
        }
    }
    
    @IBAction func switchSearchQ(_ sender: UISwitch) {
        if sender.isOn {
            isSearchQ = true
        } else {
            isSearchQ = false
        }
    }
    
    @IBAction func btnPostQ(_ sender: UIButton) {
        var isTitleEmpty = true
        var isTfQEmpty = true
        
        
        if tfTitle.text != placeHolderText && tfTitle.text != ""{ // 제목 빈칸검사
            isTitleEmpty = false
        } else {
            isTitleEmpty = true
        }
        
        if tfFirstQ.text != "" && tfSecondQ.text != "" { // 선택지 빈칸검사
            isTfQEmpty = false
        } else {
            isTfQEmpty = true
        }
        
        if isTitleEmpty == false && isTfQEmpty == false {
            let agreeNoChangeAlert = UIAlertController(title: "이대로 등록하시겠습니까?", message: "한번 작성한 투표는 삭제할 수 있으나, 수정은 불가능합니다.", preferredStyle: UIAlertController.Style.alert)
            let actionOK = UIAlertAction(title: "확인", style: .default) { (action) in // ok 누를 시 실행할 함수 입력
                // FutureUpdate : 서버로 tfFirstQ, tfSecondQ의 두 가지 정보 전달, 서버로 tfTitleBox의 글 정보 전달, 서버로 익명질문여부(isAnonymous) 정보 전달, FU : 서버로 질문검색여부(isSearchQ) 정보전달하기 구현 외 유저의 정보 서버로 넘겨 줌
                self.presentingViewController?.dismiss(animated: true)
                }
            let actionNo = UIAlertAction(title: "취소", style: .default) { (action) in }
            
            agreeNoChangeAlert.addAction(actionNo)
            agreeNoChangeAlert.addAction(actionOK)
            
            present(agreeNoChangeAlert, animated: false, completion: nil)
        } else {
            let fieldEmptyAlert = UIAlertController(title: "빈칸 알림", message: "투표의 제목과 선택지 중 하나 이상이 입력되지 않았습니다. 빈칸을 모두 입력해 주세요.", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: .default) { (action) in }
            
            fieldEmptyAlert.addAction(okAction)
            
            present(fieldEmptyAlert, animated: false, completion: nil)
        }
        
    }
    
}
