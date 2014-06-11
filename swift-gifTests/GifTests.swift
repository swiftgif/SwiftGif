//
//  GifTests.swift
//  swift-gif
//
//  Created by Arne Bahlo on 12.06.14.
//  Copyright (c) 2014 Arne Bahlo. All rights reserved.
//

import XCTest
import UIKit

class GifTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testGCDForPair() {
        let values = (9, 4011)
        let result = UIImage.gcdForPair(values.0, values.1)
        let expected = 3

        XCTAssert(result == expected, "UIImage.gcdForPair(\(values.0), \(values.1)) = \(result), but should be \(expected)")
    }

    func testGCDForArray() {
        let values = [13, 17_381, 169]
        let result = UIImage.gcdForArray(values)
        let expected = 13

        XCTAssert(result == expected, "UIImage.gcdForArray(\(values)) = \(result), but should be \(expected)")
    }

}
