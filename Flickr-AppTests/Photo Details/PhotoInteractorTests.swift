//
//  PhotoInteractorTests.swift
//  Flickr-AssignmentTests
//
//  Created by Lokesh on 03/09/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import XCTest
@testable import Flickr_App

class PhotoInteractorTests: XCTestCase {

    var sut: PhotoInteractor!   // Subject under test
    var outputMock = PhotoInteractorMock()
    
    class PhotoInteractorMock: PhotoInteractorOutput {
        
        var _photoSize: PhotoSize?
        
        func showErrorView(_ message: String) {
            
        }
        
        func getPhotoContent(_ photoSize: PhotoSize) {
            _photoSize = photoSize
        }
        
        func updateContentView(with image: UIImage) {
            
        }
    }
    
    override func setUp() {
        sut = PhotoInteractor()
        sut.presenter = outputMock
    }
    
    func test_getPhotoSize() {
        sut.photo = Photo(id: "50300186618", title: "Lindo gatito")
        sut.fetchPhoto()
        
        let wait = expectation(description: "Wait")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            wait.fulfill()
        }
        waitForExpectations(timeout: 30)

        XCTAssertTrue(outputMock._photoSize != nil)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
