//
//  RegisterVC.swift
//  AskForVote
//
//  Created by 정지원 on 2022/01/20.
//

import UIKit

class RegisterVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var viewRegisterBorder: UIView!
    
    @IBOutlet var tfRegisterID: UITextField!
    @IBOutlet var tfRegisterPW: UITextField!
    @IBOutlet var lblIDCheck: UILabel!
    @IBOutlet var lblPWCheck: UILabel!
    @IBOutlet var imgViewPWCheck: UIImageView!
    @IBOutlet weak var agePicker: UIPickerView!
    
    let age = ["10대", "20대", "30대", "40대", "50대", "60대", "70대", "80대 또는 그 이상"]
    var selectedAge = "10대"
    var selectedSex = "남성"
    
    var registerID = "" // 회원가입을 시도하는 ID
    var registerPW = "" // 회원가입을 시도하는 PW
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewRegisterBorder.layer.borderWidth = 2
        viewRegisterBorder.layer.borderColor = UIColor.systemGray5.cgColor
        viewRegisterBorder.layer.cornerRadius = 10
        
        self.agePicker.delegate = self
        self.agePicker.dataSource = self
        self.tfRegisterID.delegate = self
        self.tfRegisterPW.delegate = self
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
        /*
         FutureUpdate = selectedAge를 userAge에 저장
         registerID, registerPW를 새로 등록
         selectedSex, selectedAge를 새로 등록
        */
    }
    
}
