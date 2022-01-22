//
//  NCCenterVC.swift
//  AskForVote
//
//  Created by 정지원 on 2022/01/20.
//

import UIKit

class NCCenterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true)
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
