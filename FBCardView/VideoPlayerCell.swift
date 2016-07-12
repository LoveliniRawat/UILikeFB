//
//  VideoPlayerCell.swift
//  FBCardView
//
//  Created by Lovelini Rawat on 6/9/16.
//  Copyright © 2016 DemoBangMobile. All rights reserved.
//

import UIKit

class VideoPlayerCell: UITableViewCell {
    
    
    @IBOutlet var videoView: UIView!
    
    @IBOutlet var senderImage: UIImageView!
   
    @IBOutlet var sendingTime: UILabel!
    @IBOutlet var senderName: UILabel!
    

    
    override func awakeFromNib(){
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }
    

}
