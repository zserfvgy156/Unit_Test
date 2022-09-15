//
//  UnitTestTests.swift
//  UnitTestTests
//
//  Created by mike on 2022/9/12.
//

import XCTest
@testable import UnitTest

class UnitTestTests: XCTestCase {

    private var viewModel: LoginVerificationViewModel! = .init()
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

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

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
