//
//  SettingVC.swift
//  AskForVote
//
//  Created by 정지원 on 2022/01/20.
//

import UIKit

var profileSearchable = true // 서버로 유저 프로필 검색가능여부 전송

class SettingVC: UIViewController {

    @IBOutlet var viewAgreeProfileSearchable: UIView!
    @IBOutlet var viewSetVoteAlert: UIView!
    
    var onVoteAlert = false
    var numVoteAlert = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewAgreeProfileSearchable.layer.cornerRadius = 15
        viewSetVoteAlert.layer.cornerRadius = 15

        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchProfileSearchable(_ sender: UISwitch) {
        if sender.isOn {profileSearchable = true} else {profileSearchable = false}
    }
    
    @IBAction func btnSetVoteAlert(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SetVoteAlertVC") as? SetVoteAlertVC else {return}
        nextVC.modalPresentationStyle = .popover
        self.present(nextVC, animated: true, completion: nil)
    }
}
