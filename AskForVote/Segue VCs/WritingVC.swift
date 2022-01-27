//
//  Writing.swift
//  AskForVote
//
//  Created by 정지원 on 2022/01/20.
//

import UIKit

class WritingVC: UIViewController {

    @IBOutlet weak var viewAnonymousQ: UIView!
    @IBOutlet weak var viewSearchQ: UIView!
    @IBOutlet var tfQuestionBox: UITextField!
    
    var isAnonymousQ : Bool = false
    var isSearchQ : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAnonymousQ.layer.cornerRadius = 15 //view 코너 라운딩 설정
        viewSearchQ.layer.cornerRadius = 15
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
        // FU : 서버로 tfQuestionBox의 글 정보 전달
        // FU : 서버로 익명질문여부(isAnonymous) 정보 전달
        // FU : 서버로 질문검색여부(isSearchQ) 정보 전달
    }
    
}
