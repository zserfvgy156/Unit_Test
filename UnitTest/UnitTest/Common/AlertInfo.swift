//
//  AlertInfo.swift
//  UnitTest
//
//  Created by mike on 2022/9/15.
//

import Foundation


/// 提示訊息的狹帶資料
struct AlertInfo: Identifiable {
    var id: String { title }
    let title: String
    let message: String
}


