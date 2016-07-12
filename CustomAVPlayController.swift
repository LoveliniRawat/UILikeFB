//
//  CustomAVPlayController.swift
//  FBCardView
//
//  Created by Lovelini Rawat on 6/17/16.
//  Copyright © 2016 DemoBangMobile. All rights reserved.
//

import UIKit
import AVKit

class CutomAVPlayController : AVPlayerViewController{
    
    
    // Create a UIView to put on top of all
    //lazy var topView = UIView(frame: CGRectMake(0, 0, 400, 400))
    
    var videoTagValue : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // For sure, set it to clearcolor
        // (DON'T set alpha = 0 because it will stop receiving user interaction)
       // topView.backgroundColor = UIColor.clearColor()
        
        // Add it to the view of AVPlayerViewController
       // self.view.addSubview(topView)
        
        // Bring it to front
      //  self.view.bringSubviewToFront(topView)
        
        // Add a tap gesture recognizer
       // topView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "handleTap"))
    }
    
    // Handle the tap
    func handleTap() {
        
        // Show the control
        
        print("show PlayBackControl")
        //self.showsPlaybackControls = true
        // Hide the topView. You can unhide it when needed later.
        //self.topView.hidden = true
    }
    
    
}
