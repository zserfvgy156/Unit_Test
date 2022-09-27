//
//  UnitTestUITests.swift
//  UnitTestUITests
//
//  Created by mike on 2022/9/12.
//

import XCTest

class UnitTestUITests: XCTestCase {

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
//    相關判斷式
//    ================================
//    //判斷是否為True
//    XCTAssert()
//    //判斷是否為false
//    XCTAssertFalse
//    //判斷是否相同
//    XCTAssertEqual()
//    //判斷是否不相同
//    XCTAssertNotEqual
//    //判浮點數是否相等
//    XCTAssertEqualWithAccuracy()
//    //判斷是否為空
//    XCTAssertNil()
//    //判斷是否不為空
//    XCTAssertNotNil()
//    //無條件失敗
//    XCTFail()
    
    
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        
        let app = XCUIApplication()
        app.launch()
        
        ///信箱輸入測試
        let email = app.textFields["email"]
        email.tap()
        email.typeText("cmecid@gmail.com")

        ///密碼輸入測試
        ///隨機生成0-8長度的組合密碼
        let passwordString = randomString(length: Int.random(in: 0...8))
        let passwordTextFields = app.secureTextFields["password"]
        passwordTextFields.tap()
        passwordTextFields.typeText(passwordString)

        /// 判斷登入按鈕是否存在
        let loginButtonIsExists = app.buttons["login"].exists
        XCTAssert(loginButtonIsExists)
        
        /// 判斷登入按鈕是否可以點擊
        let loginButtonIsHittable = app.buttons["login"].exists
        XCTAssert(loginButtonIsHittable)
                
        ///登入按鈕測試
//        app.switches["rememberMe"].tap()
        app.buttons["login"].doubleTap()
//        app.buttons["login"].twoFingerTap()
        
    
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    ///  隨機生成字串
    private func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }


//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
