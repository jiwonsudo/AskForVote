//
//  SettingVC.swift
//  AskForVote
//
//  Created by 정지원 on 2022/01/20.
//

import UIKit

class SettingVC: UIViewController {

    @IBOutlet var viewAgreeProfileSearchable: UIView!
    @IBOutlet var viewAgreeDarkMode: UIView!
    @IBOutlet var viewSetVoteAlert: UIView!
    
    var profileSearchable = true
    var onDarkmode = true
    var onVoteAlert = false
    var numVoteAlert = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewAgreeDarkMode.layer.cornerRadius = 15
        viewAgreeProfileSearchable.layer.cornerRadius = 15
        viewSetVoteAlert.layer.cornerRadius = 15

        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchProfileSearchable(_ sender: UISwitch) {
        if sender.isOn {profileSearchable = true} else {profileSearchable = false}
    }
    @IBAction func switchDarkMode(_ sender: UISwitch) {
        if sender.isOn {onDarkmode = true} else {onDarkmode = false}
    }
    @IBAction func btnSetVoteAlert(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SetVoteAlertVC") as? SetVoteAlertVC else {return}
        nextVC.modalPresentationStyle = .popover
        self.present(nextVC, animated: true, completion: nil)
    }
}
