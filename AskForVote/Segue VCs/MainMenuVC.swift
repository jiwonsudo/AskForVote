//
//  ViewController.swift
//  AskForVote
//
//  Created by 정지원 on 2022/01/19.
//

import UIKit

class MainMenuVC: UIViewController {
    
    var testImage = UIImage(named: "EmptyProfileIcon")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func notLoginedYet(){
        let notLoginedAlert = UIAlertController(title: "로그인 알림", message: "로그인을 먼저 진행해 주세요.", preferredStyle: .alert)
        let actionGoLogin = UIAlertAction(title: "로그인 창으로 이동", style: .default, handler: {(action) in
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC else {return}
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
        })
        let actionCancle = UIAlertAction(title: "취소", style: .default, handler: {(action) in})
        notLoginedAlert.addAction(actionGoLogin)
        notLoginedAlert.addAction(actionCancle)
        present(notLoginedAlert, animated: true, completion: nil)
    }
    
    @IBAction func btnGoProfile(_ sender: UIBarButtonItem) {
        if isLogin == false {
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC else {return}
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
        } else {
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC else {return}
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnGoSearch(_ sender: UIBarButtonItem) {
        if isLogin == true {
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchVC") as? SearchVC else {return}
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
        } else {
            notLoginedYet()
        }
    }
    
    @IBAction func btnGoNCCenter(_ sender: UIBarButtonItem) {
        if isLogin == true {
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "NCCenterVC") as? NCCenterVC else {return}
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
        } else {
            notLoginedYet()
        }
    }
    
    @IBAction func btnGoMyQ(_ sender: UIBarButtonItem) {
        if isLogin == true {
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "MyQVC") as? MyQVC else {return}
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
        } else {
            notLoginedYet()
        }
    }
    
    @IBAction func btnGoWriting(_ sender: UIBarButtonItem) {
        if isLogin == true {
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "WritingVC") as? WritingVC else {return}
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
        } else {
            notLoginedYet()
        }
    }
    
    @IBAction func btnGoSetting(_ sender: UIBarButtonItem) {
        if isLogin == true {
            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SettingVC") as? SettingVC else {return}
            nextVC.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
        } else {
            notLoginedYet()
        }
    }
}
