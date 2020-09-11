//
//  PhotosInteractorTests.swift
//  Flickr-AssignmentTests
//
//  Created by Lokesh on 03/09/2020.
//  Copyright © 2020 Lokesh Vunnam. All rights reserved.
//

import XCTest
@testable import Flickr_App

class PhotosInteractorTests: XCTestCase {

    var sut: PhotosInteractor!   // Subject under test
    var outputMock = PhotosInteractorMock()
    
    class PhotosInteractorMock: PhotosInteractorOutput {
        
        var isFetchedPhotos = false
        
        func updateContent() {
            isFetchedPhotos = true
        }
        
        func showErrorView(_ message: String) {
            isFetchedPhotos = false
        }
    }
    
    override func setUp() {
        sut = PhotosInteractor()
        sut.presenter = outputMock
    }
    
    func test_getPhotos() {
        sut.searchPhotos("Kitten")
        
        let wait = expectation(description: "Wait")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            wait.fulfill()
        }
        waitForExpectations(timeout: 30)

        XCTAssert(outputMock.isFetchedPhotos)
        XCTAssertTrue(sut.getPhotosCount() > 0)
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
