//
//  LoginVC.swift
//  AskForVote
//
//  Created by 정지원 on 2022/01/20.
//

import UIKit

var serverID = ""
var serverPW = ""

class LoginVC: UIViewController {
    
    @IBOutlet var lblLoginAlert: UILabel!
    @IBOutlet var tfID: UITextField!
    @IBOutlet var tfPW: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true)
    }
    @IBAction func btnLogin(_ sender: UIButton) {
        let inputID = tfID.text
        let inputPW = tfPW.text
        
        serverID = "test" //TESTCODE 로그인
        serverPW = "test" //TESTCODE 로그인
        
        guard let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainMenuVC") as? MainMenuVC else {return}
        
        if inputID == serverID && inputPW == serverPW{
            mainVC.isLogin = true
            lblLoginAlert.text = "로그인에 성공했습니다. 메인화면으로 이동합니다."
            self.navigationController?.pushViewController(mainVC, animated: true) // push가 아니라 데이터가 안넘어감. 아래 두 조건도 마찬가지
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.7) {
                self.presentingViewController?.dismiss(animated: true)
            }
        } else if inputID == serverID && inputPW != serverPW{
            mainVC.isLogin = false
            self.navigationController?.pushViewController(mainVC, animated: true)
            lblLoginAlert.text = "비밀번호가 틀렸습니다."
        } else {
            mainVC.isLogin = false
            self.navigationController?.pushViewController(mainVC, animated: true)
            lblLoginAlert.text = "가입되지 않은 ID입니다."
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
