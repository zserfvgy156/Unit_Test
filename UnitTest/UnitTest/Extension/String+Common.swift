//
//  String+Common.swift
//  UnitTest
//
//  Created by mike on 2022/9/15.
//

import Foundation


extension String {
    
    /// 判斷是否為信箱格式
    /// - Returns: 回傳結果
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}
