//
//  GifTests.swift
//  SwiftGif
//
//  Created by Arne Bahlo on 12.06.14.
//  Copyright (c) 2014 Arne Bahlo. All rights reserved.
//

import XCTest
import UIKit
import ImageIO

class GifTests: XCTestCase {

    var imageData: Data?
    var source: CGImageSource?

    override func setUp() {
        super.setUp()

        imageData = try? Data(contentsOf: Bundle(for:GifTests.self)
            .url(forResource: "test", withExtension: "gif")!)

        let cfImageData = imageData! as CFData
        source = CGImageSourceCreateWithData(cfImageData, nil)
    }

    override func tearDown() {
        imageData = nil
        source = nil

        super.tearDown()
    }

    func testGCDForPair() {
        let values = (9, 4011)
        let result = UIImage.gcdForPair(values.1, values.0)
        let expected = 3

        XCTAssert(result == expected,
            "UIImage.gcdForPair(\(values.0), \(values.1)) = \(result), but should be \(expected)")
    }

    func testGCDForArray() {
        let values = [13, 17_381, 169]
        let result = UIImage.gcdForArray(values)
        let expected = 13

        XCTAssert(result == expected,
            "UIImage.gcdForArray(\(values)) = \(result), but should be \(expected)")
    }

    func testDelayForImageAtIndex() {
        let result = UIImage.delayForImageAtIndex(0, source: source!)
        let expected = 0.5

        XCTAssert(result == expected,
            "UIImage.delayForImageAtIndex(0, source) = \(result), but should be \(expected)")
    }

    func testAnimatedImageWithSource() {
        let image = UIImage.animatedImageWithSource(source!)

        XCTAssertNotNil(image,
            "UIImage.animatedImageWithSource(source) is nil, but shouldn't")

        // Note: There should be 12, because they delay is the same for all
        let frames = image!.images as Array?
        XCTAssert(frames!.count == 12, "image.images.count = \(frames!.count), but should be 12")

        XCTAssert(image!.duration == 6.0, "image.duration = \(image!.duration), but should be 6.0")
    }

}
