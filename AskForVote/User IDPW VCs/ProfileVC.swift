//
//  ProfileVC.swift
//  AskForVote
//
//  Created by 정지원 on 2022/01/20.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet var imgViewProfile: UIImageView!
    @IBOutlet weak var lblUserID: UILabel! // 유저ID 표시 기능
    @IBOutlet var btnLogOut: UIButton!
    
    let imagePicker = UIImagePickerController() //이미지 선택 기능
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblUserID.text = loginedID
        
        imagePicker.delegate = self
        
        btnLogOut.setTitleColor(.red, for: .normal)
        imgViewProfile.layer.borderWidth = 1
        imgViewProfile.layer.masksToBounds = false
        imgViewProfile.layer.borderColor = UIColor.lightGray.cgColor
        imgViewProfile.layer.cornerRadius = imgViewProfile.frame.height/2
        imgViewProfile.clipsToBounds = true
        imgViewProfile.image = userImg // FutureUpdate 뷰 시작 시 이미지 = userImg 불러옴
    }

    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func btnPickImage(_ sender: UIButton) {
        self.imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
 self.present(imagePicker,animated: true, completion: nil)
    }
    
    @IBAction func btnChangeUserID(_ sender: UIButton) {
        // FutureUpdate 유저ID 겹치는지 체크 후 userID 변경
    }
    
    @IBAction func btnInitialProfile(_ sender: UIButton) {
        // FutureUpdate userImg를 초기 이미지로 업로드
        userImg = UIImage(named: "EmptyProfileIcon.png")
        imgViewProfile.image = userImg
    }
    
    @IBAction func btnLogOut(_ sender: Any) { //로그아웃 구현 필요
        isLogin = false
        lblUserID.text = "USERID"
        self.presentingViewController?.dismiss(animated: true)
    }
    
}

extension ProfileVC : UIImagePickerControllerDelegate,
UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage]{ //편집된 이미지를 image에 저장
            imgViewProfile.image = image as? UIImage
            userImg = image as? UIImage // FutureUpdate userImg에 이미지 업로드
            
        }
        dismiss(animated: true, completion: nil)
    }
}
