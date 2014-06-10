//
//  Gif.swift
//  Gifd
//
//  Created by Arne Bahlo on 07.06.14.
//  Copyright (c) 2014 Arne Bahlo. All rights reserved.
//

import UIKit
import ImageIO

// TODO: Release stuff
extension UIImage {
    
    class func animatedImageWithData(data: NSData) -> UIImage? {
        let source = CGImageSourceCreateWithData(data, nil).takeRetainedValue()
        let image = UIImage.animatedImageWithSource(source)
        CFRelease(source) // We need to do this, because source is from type Unmanaged<CGImageSource>
        
        return image
    }
    
    class func delayForImageAtIndex(index: UInt, source: CGImageSourceRef) -> Double {
        var delay = 0.1
        
        // Get dictionaries
        let cfProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil)
        let properties: NSDictionary = cfProperties.takeRetainedValue() // Make NSDictionary
        
        var gifProperties : NSDictionary = properties[String(kCGImagePropertyGIFDictionary)] as NSDictionary
        
        // Get delay time
        var number : AnyObject! = gifProperties[String(kCGImagePropertyGIFUnclampedDelayTime)]
        if number == nil || number.doubleValue == 0 {
            number = gifProperties[String(kCGImagePropertyGIFDelayTime)]
        }
        
        delay = number as Double
        
        if delay < 0.1 {
            delay = 0.1 // Make sure, they're not too fast
        }
        
        CFRelease(cfProperties)
        
        return delay
    }
    
    class func gcdForPair(var a: Int?, var b: Int?) -> Int {
        // Check if one of them is nil
        if !a || !b {
            if b {
                return b!
            } else if a {
                return a!
            } else {
                return 0
            }
        }
        
        // Swap for modulo
        if a < b {
            var c = a
            a = b
            b = c
        }
        
        // Get greatest common divisor
        var rest: Int
        while true {
            rest = a! % b!
            
            if rest == 0 {
                return b! // Found it
            } else {
                a = b
                b = rest
            }
        }
    }
    
    class func gcdForArray(array: Array<Int>) -> Int {
        if array.isEmpty {
            return 1
        }
        
        var gcd = array[0]
        
        for val in array {
            gcd = UIImage.gcdForPair(val, b: gcd)
        }
        
        return gcd
    }
    
    class func animatedImageWithSource(source: CGImageSource) -> UIImage? {
        let count = CGImageSourceGetCount(source)
        var images = CGImageRef[]()
        var delays = Int[]()
        
        // Fill arrays
        for i in 0..count {
            // Add image
            images.append(CGImageSourceCreateImageAtIndex(source, i, nil).takeRetainedValue())
            
            // At it's delay in cs
            var delaySeconds = UIImage.delayForImageAtIndex(UInt(i), source: source)
            delays.append(Int(delaySeconds * 1000.0)) // Seconds to ms
        }
        
        // Calculate full duration
        let duration: Int = {
            var sum = 0
            
            for val: Int in delays {
                sum += val
            }
            
            return sum
            }()
        
        // Get frames
        let gcd = gcdForArray(delays)
        var frames = UIImage[]()
        
        var frame: UIImage
        var frameCount: Int
        for i in 0..count {
            frame = UIImage(CGImage: images[Int(i)])
            frameCount = Int(delays[Int(i)] / gcd)
            
            for j in 0..frameCount {
                frames.append(frame)
            }
        }
        
        // Heyhey
        let animation = UIImage.animatedImageWithImages(frames, duration: Double(duration) / 1000.0)
        
        return animation
    }
    
}
