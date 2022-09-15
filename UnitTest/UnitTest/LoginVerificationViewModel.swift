//
//  LoginVerificationViewModel.swift
//  UnitTest
//
//  Created by mike on 2022/9/12.
//

import Foundation


class LoginVerificationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published private(set) var errorText: String?

    
    var isLoginDisabled: Bool { isLogin || email.isEmpty || password.isEmpty }
    
    private var isLogin = false
    
    
    /// 登入
    func login() {
        guard !email.isEmpty || password.isEmpty else { return }
        guard !isLogin else { return }
     
        isLogin = true
        errorText = nil
        
        
        // 故意生成錯誤
        var a: [String] = []
        a[0] = String(a[0].prefix(5))
        
        
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
