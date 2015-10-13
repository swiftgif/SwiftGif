//
//  RootViewController.swift
//  SwiftGif
//
//  Created by Arne Bahlo on 10.06.14.
//  Copyright (c) 2014 Arne Bahlo. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil);
    }

    required init(coder aDecoder: NSCoder) {
        // FIXME: Why do we have to implement this?
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let jeremyGif = UIImage.gifWithName("jeremy")
        let imageView = UIImageView(image: jeremyGif)
        imageView.frame = CGRect(x: 0.0, y: 20.0, width: 350.0, height: 202.0)
        
        view.addSubview(imageView)
        
        
        let imageData = NSData(contentsOfURL: NSBundle.mainBundle().URLForResource("adventure-time", withExtension: "gif")!)
        let advTimeGif = UIImage.gifWithData(imageData!)
        let imageView2 = UIImageView(image: advTimeGif)
        imageView2.frame = CGRect(x: 0.0, y: 222.0, width: 350.0, height: 202.0)
        
        view.addSubview(imageView2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
