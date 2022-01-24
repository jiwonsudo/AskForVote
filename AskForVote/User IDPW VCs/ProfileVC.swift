//
//  ProfileVC.swift
//  AskForVote
//
//  Created by 정지원 on 2022/01/20.
//

import UIKit

var imgSelected = UIImage(named: "EmptyProfileIcon.png") //선택된 프로필 이미지

class ProfileVC: UIViewController {
    
    @IBOutlet var imgViewProfile: UIImageView!
    @IBOutlet var lblUserName: UILabel! // 유저명 표시 기능
    @IBOutlet var btnLogOut: UIButton!
    
    let imagePicker = UIImagePickerController() //이미지 선택 기능
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnLogOut.setTitleColor(.red, for: .normal)
        
        imgViewProfile.layer.borderWidth = 1
        imgViewProfile.layer.masksToBounds = false
        imgViewProfile.layer.borderColor = UIColor.lightGray.cgColor
        imgViewProfile.layer.cornerRadius = imgViewProfile.frame.height/2
        imgViewProfile.clipsToBounds = true
        
        imagePicker.delegate = self
        
        imgViewProfile.image = imgSelected //뷰 시작 시 이미지 = imgSelected
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func btnPickImage(_ sender: UIButton) {
        self.imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
 self.present(imagePicker,animated: true, completion: nil)
    }
    
    @IBAction func btnInitialProfile(_ sender: UIButton) {
        imgSelected = UIImage(named: "EmptyProfileIcon.png")
        imgViewProfile.image = imgSelected
    }
    
    @IBAction func btnLogOut(_ sender: Any) { //로그아웃 구현 필요
    }
    
}

extension ProfileVC : UIImagePickerControllerDelegate,
UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage]{ //편집된 이미지를 image에 저장
            imgViewProfile.image = image as? UIImage
            imgSelected = image as? UIImage //image를 imgSelected에 저장
            
        }
        dismiss(animated: true, completion: nil)
    }
}
