//
//  LoginVerificationViewModel.swift
//  UnitTest
//
//  Created by mike on 2022/9/12.
//

import Foundation
import SwiftUI


class LoginVerificationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var alertInfo: AlertInfo?
    @Published private(set) var errorText: String?

    
    var isLoginDisabled: Bool { isLogin || email.isEmpty || password.isEmpty }
    
    var isAuthorized: Bool
    private var isLogin = false
    
    
    init(isAuthorized: Bool) {
        self.isAuthorized = isAuthorized
    }
    
    
    /// 登入
    func login() {
        
        /// 信箱與密碼不為空
        guard !email.isEmpty || password.isEmpty else {
            alertInfo = .init(title: "登入失敗", message: "信箱或密碼不為空！")
            return
        }
        
        /// 信箱格式錯誤
        guard !email.isValidEmail() else {
            alertInfo = .init(title: "登入失敗", message: "信箱格式錯誤！")
            return
        }
        
        /// 密碼格式錯誤
        guard password.count > 8 else {
            alertInfo = .init(title: "登入失敗", message: "密碼格式錯誤！")
            return
        }
        
        /// 登入中
        guard !isLogin else { return }
     
        /// 初始化
        isLogin = true
        errorText = nil
        
        
        // 故意生成錯誤
//        var a: [String] = []
//        a[0] = String(a[0].prefix(5))
        
        
//        Task {
//
//
////            let error = NSError(domain: "", code: 404)
//
//
//
//            isLogin = false
//        }
    }
}

