//
//  FakeServerForTest.swift
//  AskForVote
//
//  Created by 정지원 on 2022/01/29.
//

import Foundation
import UIKit

/*
 본 파일 "ServerVarTest"는 본래 서버 구축 시 백엔드를 통해 데이터베이스에서 불러와야
 하는 정보들을 서버 구축 전에 테스트해 보기 위하여 전역변수로 임시 지정한 것입니다. 추후
 서버 구축 후 각 변수를 업데이트하는 과정이 끝난 경우 지워도 무방한 파일입니다.
 */

/*
 DB 정보 json (예정)
 {
 "userID" : "",
 "userPW" : "",
 "userSex" : "",
 "userAge" : ""
 }
 */

var userImg = UIImage(named: "EmptyProfileIcon.png") //해당 계정의 프로필 이미지(b.e)
var isLogin : Bool = false // 로그인 상태 (실제 전역변수 지정)
var loginedID = "test" // 앱에 저장되는 로그인된 ID
var loginedPW = "test" // DB에 있는 ID 중 선택된 로그인된 유저의 PW
var loginedSex = "남성" // 로그인한 유저의 성별 정보 : 남성, 여성, 기타
var loginedAge = "10대" // 유저의 연령대 정보 : ["10대", "20대", "30대", "40대", "50대", "60대", "70대", "80대 또는 그 이상"]
