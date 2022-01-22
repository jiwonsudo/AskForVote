//
//  ProfileVC.swift
//  AskForVote
//
//  Created by 정지원 on 2022/01/20.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet var imgViewProfile: UIImageView!
    
    let imagePicker = UIImagePickerController() //이미지 선택 기능
    var imgSelected = UIImage(named: "EmptyProfileIcon.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgViewProfile.layer.borderWidth = 1
        imgViewProfile.layer.masksToBounds = false
        imgViewProfile.layer.borderColor = UIColor.lightGray.cgColor
        imgViewProfile.layer.cornerRadius = imgViewProfile.frame.height/2
        imgViewProfile.clipsToBounds = true
        
        imagePicker.delegate = self
        
        imgViewProfile.image = imgSelected
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func btnPickImage(_ sender: UIButton) {
        self.imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker,animated: true, completion: nil)
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

extension ProfileVC : UIImagePickerControllerDelegate,
UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage]{ //편집된 이미지를 imgProgfile의 이미지로 설정
            imgViewProfile.image = image as? UIImage
            
        }
        dismiss(animated: true, completion: nil)
    }
}
