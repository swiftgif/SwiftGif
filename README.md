# SwiftGif [![Build Status](https://travis-ci.org/bahlo/SwiftGif.svg?branch=master)](https://travis-ci.org/bahlo/SwiftGif)

A small `UIImage` extension with gif support.

![Demo gif](demo.gif)

## Usage
Import the `Gif.swift` in your project and do the following:
```swift
// jeremy.gif
var url = NSBundle.mainBundle().URLForResource("jeremy", withExtension: "gif")
var imageData = NSData(contentsOfURL: url)

// Returns an animated UIImage
UIImage.animatedImageWithData(imageData)
```

## How does it work?
Easy, it does the following:

1. Find out the duration of every frame
2. Find the greatest common divisor
3. Add frames accordingly to the greatest common divisor to an array
4. Create an animated UIImage with the frames

# Inspiration
This project is heavily inspired by [uiimage-from-animated-gif](https://github.com/mayoff/uiimage-from-animated-gif).
Kudos to [@mayoff](https://github.com/mayoff). :thumbsup:

## License
This repository is licensed under the MIT license, more under
[LICENSE](LICENSE).

