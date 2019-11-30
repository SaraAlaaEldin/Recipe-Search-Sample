//
//  Recipe_SearchTests.swift
//  Recipe SearchTests
//
//  Created by Sara Alaa on 11/25/19.
//  Copyright © 2019 Sara Alaa. All rights reserved.
//

import XCTest
@testable import Recipe_Search

class Recipe_SearchTests: XCTestCase {
    var serchListVM :SLM? = SLM()
    var resData:SearchList?
    var statusCode:Int?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
//
    func testCheckSearchResultReturn(){
        let expectation = self.expectation(description: "APIServices")

        APIServices.getRecipeSearchResultList(url:useReturnURl(), completion: { result,status in
            self.resData = result
            self.statusCode = status
            expectation.fulfill()
                     }, failure: { error in
                        XCTFail( error!.localizedDescription)
                        XCTFail( "Failed")
                        
                     })

        wait(for: [expectation], timeout: 10.0)

    XCTAssertGreaterThan(self.resData?.count ?? 0, 99990, "should have values")
    XCTAssertNotNil(self.resData, " shouldn't be nil")
        // XCTAssertEqual(self.resData?.count, 0)
//    XCTAssertNotNil(nil, "shouldn't be nil")
//    XCTAssertLessThanOrEqual(self.resData?.count ?? 0, 0, " equal 0 ")
//        XCTAssertEqual(self.statusCode, 200)
    }
    
    func testEncodeURLSuccess(){
        
        XCTAssertNotNil(useReturnURl())
//        XCTAssertEqual(useReturnURl(), "")
    }
    

    func useReturnURl()->String{
        let urlEncoded =  serchListVM?.encodeURLString(decodedString: "https://api.edamam.com/search?q=chicken&app_id=a0730235&app_key=7cf6d200b97bdb544efca408a2b491ac")
        return urlEncoded ?? ""
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
