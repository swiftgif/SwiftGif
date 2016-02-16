//
//  DemoVC.swift
//  SwiftGif
//
//  Created by Mustafa Hastürk on 16/02/16.
//  Copyright © 2016 Arne Bahlo. All rights reserved.
//

import UIKit

class DemoVC: UIViewController {
  
  @IBOutlet weak var topImageView: UIImageView!
  @IBOutlet weak var bottomImageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.topImageView.image = UIImage.gifWithName("jeremy")
    
    
    let imageData = NSData(contentsOfURL: NSBundle.mainBundle().URLForResource("adventure-time", withExtension: "gif")!)
    
    self.bottomImageView.image = UIImage.gifWithData(imageData!)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}
