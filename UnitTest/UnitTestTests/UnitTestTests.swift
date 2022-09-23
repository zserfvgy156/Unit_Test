//
//  UnitTestTests.swift
//  UnitTestTests
//
//  Created by mike on 2022/9/12.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import UnitTest

class UnitTestTests: XCTestCase {

    private var viewModel: LoginVerificationViewModel! = .init(isAuthorized: false)
    private var sut: URLSession!
    
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = URLSession(configuration: .default)
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        
        /// 清除
        sut = nil
        
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    // 信箱與密碼測試
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        
        XCTAssertTrue(viewModel.isLoginDisabled)

        /// 測試密碼格式錯誤
        viewModel.email = "zserfvgy@gmail.com"
        viewModel.password = ""
        XCTAssertTrue(viewModel.isLoginDisabled)

        /// 測試格式正確
        viewModel.email = "zserfvgy@gmail.com"
        viewModel.password = "1223213123123"
        XCTAssertFalse(viewModel.isLoginDisabled)
    }
    
    
    // 測試基本 ViewInspector 套件
    func testTextExample() throws {
        let expected = "it lives!"
        let sut = Text(expected)
        let value = try sut.inspect().text().string()
        XCTAssertEqual(value, expected)
    }
    
    // 異步測試
    func testValidApiCallGetsHTTPStatusCode200() throws {
        
        // 測試網址 (0-100 隨機吐一)
        let urlString = "http://www.randomnumberapi.com/api/v1.0/random?min=0&max=100&count=1"
        let url = URL(string: urlString)!
        
        // 成功回傳
        let promise = expectation(description: "Status code: 200")

        // 開始請求
        sut.dataTask(with: url) { _, response, error in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }.resume()
        

        // 等待期望值，若超出時間表示失敗。
        wait(for: [promise], timeout: 5)
    }
    
    // 快速失敗 (不經過 timeout)
    func testApiCallCompletes() throws {
        
        let urlString = "http://www.randomnumberapi.com/test"  // 無效網址 (404)
        let url = URL(string: urlString)!
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?

        // 開始請求
        sut.dataTask(with: url) { _, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill() // 不論結果，直接成功運行。
        }.resume()
        
        wait(for: [promise], timeout: 5)

        // 快速顯示錯誤
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
    
    
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
