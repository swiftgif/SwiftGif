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
    self.topImageView.image = UIImage.gif(name: "jeremy")
    
    let imageData = try! Data(contentsOf: Bundle.main.url(forResource: "adventure-time", withExtension: "gif")!)
    self.bottomImageView.image = UIImage.gif(data: imageData)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}
