//
//  RegisterVC.swift
//  AskForVote
//
//  Created by 정지원 on 2022/01/20.
//

import UIKit

class RegisterVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var viewRegisterBorder: UIView!
    
    @IBOutlet var tfIDtoRegister: UITextField!
    @IBOutlet var tfPWtoRegister: UITextField!
    @IBOutlet var tfPWtoDoubleCheck: UITextField!
    @IBOutlet var lblIDCheck: UILabel!
    @IBOutlet var lblPWCheck: UILabel!
    @IBOutlet var lblPWDoubleCheck: UILabel!
    @IBOutlet weak var imgViewPWCheck: UIImageView!
    @IBOutlet weak var imgViewIDCheck: UIImageView!
    @IBOutlet weak var imgViewPWDoubleCheck: UIImageView!
    @IBOutlet weak var agePicker: UIPickerView!
    
    let age = ["10대", "20대", "30대", "40대", "50대", "60대 또는 그 이상"]
    var selectedAge = "10대"
    var selectedSex = "남성"
    
    let minIDLength = 4
    let minPWLength = 8
    let maxIDPWLength = 20
    var isIDAvailable = false
    var isPWAvailable = false
    var isPWDoubleChecked = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewRegisterBorder.layer.borderWidth = 2
        viewRegisterBorder.layer.borderColor = UIColor.systemGray5.cgColor
        viewRegisterBorder.layer.cornerRadius = 10
        
        self.agePicker.delegate = self
        self.agePicker.dataSource = self
        self.tfIDtoRegister.delegate = self
        self.tfPWtoRegister.delegate = self
        self.tfPWtoDoubleCheck.delegate = self
        
        imgViewIDCheck.image = UIImage(systemName: "xmark.square")
        imgViewIDCheck.tintColor = UIColor.systemRed
        imgViewPWCheck.image = UIImage(systemName: "xmark.shield")
        imgViewPWCheck.tintColor = UIColor.systemRed
        imgViewPWDoubleCheck.image = UIImage(systemName: "xmark.square")
        imgViewPWDoubleCheck.tintColor = UIColor.systemRed
    }
    
    func IDCheck(ID : String?) -> Bool { // ID 입력 정규식에 맞는지 체크
        guard ID != nil else { return false }
        let IDReg = "[a-z0-9_]{4,20}" // ID 정규식
        let pred = NSPredicate(format:"SELF MATCHES %@", IDReg)
        return pred.evaluate(with: ID)
    }
    
    func PWCheck(PW : String?) -> Bool { // PW 입력 정규식에 맞는지 체크
        guard PW != nil else { return false }
        let PWReg = "(?=.*[0-9])(?=.*[a-z])[A-Za-z0-9`~!@#$%^&*()\\-_=+\\[{\\]}\\\\|;:'\",<.>/?]{8,20}" // PW 정규식
        let pred = NSPredicate(format: "SELF MATCHES %@", PWReg)
        return pred.evaluate(with: PW)
    }
    
    func checkIDPW(textField : UITextField){
        
        if textField == tfIDtoRegister {
            let IDField = textField
            if IDCheck(ID: IDField.text) == true {
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
            } else {
                lblIDCheck.text = "ID가 조건에 맞지 않습니다. (4~20자리, 영어 소문자, 숫자, 언더바(_) 사용 가능)"
                lblIDCheck.textColor = UIColor.systemRed
                imgViewIDCheck.image = UIImage(systemName: "xmark.square")
                imgViewIDCheck.tintColor = UIColor.systemRed
                isIDAvailable = false
            }
        } else if textField == tfPWtoRegister {
            let PWField = textField
            if PWCheck(PW: PWField.text) == true {
                lblPWCheck.text = "사용 가능한 비밀번호입니다."
                lblPWCheck.textColor = UIColor.systemGreen
                imgViewPWCheck.image = UIImage(systemName: "checkmark.shield")
                imgViewPWCheck.tintColor = UIColor.systemGreen
                isPWAvailable = true
            } else {
                lblPWCheck.text = "비밀번호가 조건에 맞지 않습니다. (8~20자리, 영어, 특수문자, 숫자 사용 가능, 영어 소문자와 숫자는 꼭 포함해야 함)"
                lblPWCheck.textColor = UIColor.systemRed
                imgViewPWCheck.image = UIImage(systemName: "xmark.shield")
                imgViewPWCheck.tintColor = UIColor.systemRed
                isPWAvailable = false
                
                lblPWDoubleCheck.text = "사용할 수 없는 비밀번호입니다."
                lblPWDoubleCheck.textColor = UIColor.systemRed
                imgViewPWDoubleCheck.image = UIImage(systemName: "xmark.square")
                imgViewPWDoubleCheck.tintColor = UIColor.systemRed
                isPWDoubleChecked = false
            }
        } else if textField == tfPWtoDoubleCheck {
            let PWDoubleCheckField = textField
            if isPWAvailable == true && PWDoubleCheckField.text == tfPWtoRegister.text {
                lblPWDoubleCheck.text = "비밀번호가 동일합니다."
                lblPWDoubleCheck.textColor = UIColor.systemGreen
                imgViewPWDoubleCheck.image = UIImage(systemName: "checkmark.square")
                imgViewPWDoubleCheck.tintColor = UIColor.systemGreen
                isPWDoubleChecked = true
            } else if isPWAvailable == true && PWDoubleCheckField.text != tfPWtoRegister.text {
                lblPWDoubleCheck.text = "비밀번호가 일치하지 않습니다."
                lblPWDoubleCheck.textColor = UIColor.systemRed
                imgViewPWDoubleCheck.image = UIImage(systemName: "xmark.square")
                imgViewPWDoubleCheck.tintColor = UIColor.systemRed
                isPWDoubleChecked = false
            } else {
                lblPWDoubleCheck.text = "사용할 수 없는 비밀번호입니다."
                lblPWDoubleCheck.textColor = UIColor.systemRed
                imgViewPWDoubleCheck.image = UIImage(systemName: "xmark.square")
                imgViewPWDoubleCheck.tintColor = UIColor.systemRed
                isPWDoubleChecked = false
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkIDPW(textField: textField)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { // textfield 입력 길이 수 제한

        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92 {
                return true
            }
        }

        guard textField.text!.count < maxIDPWLength else {
            return false
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return age.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedAge = age[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return age[row]
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func segconSelectSex(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            selectedSex = "남성"
        } else if sender.selectedSegmentIndex == 1 {
            selectedSex = "여성"
        } else if sender.selectedSegmentIndex == 2 {
            selectedSex = "기타"
        }
    }
    
    @IBAction func btnRegister(_ sender: UIButton) {
        
        if isIDAvailable == true && isPWAvailable == true {
            if isPWDoubleChecked == true {
                /*
                 FutureUpdate = selectedAge를 userAge에 저장
                 registerID, registerPW를 새로 등록
                 selectedSex, selectedAge를 새로 등록
                */
                
                let userName = tfIDtoRegister.text
                let successAlert = UIAlertController(title: "회원가입 성공!", message:  "\(userName!)님, 성공적으로 회원가입되었습니다!", preferredStyle: .alert)
                let actionGoLogin = UIAlertAction(title: "로그인 화면으로 이동", style: .default) { UIAlertAction in
                    self.presentingViewController?.dismiss(animated: true)
                }
                successAlert.addAction(actionGoLogin)
                present(successAlert, animated: true, completion: nil)
            } else {
                let failAlert = UIAlertController(title: "경고", message: "회원가입에 필요한 정보 중 잘못 입력되었거나 사용할 수 없는 항목이 있습니다. 다시 확인해주세요.", preferredStyle: .alert)
                let actionOK = UIAlertAction(title: "확인", style: .default, handler: { (action) in })
                failAlert.addAction(actionOK)
                present(failAlert, animated: true, completion: nil)
            }
        }
    }
    
}
