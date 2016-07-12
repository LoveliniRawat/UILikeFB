//
//  PosterCell.swift
//  FBCardView
//
//  Created by Lovelini Rawat on 6/14/16.
//  Copyright © 2016 DemoBangMobile. All rights reserved.
//

import UIKit

class PosterCell: UITableViewCell {
    
    
    @IBOutlet var viewLabel: UILabel!
    @IBOutlet var posterStatus: UITextView!
    @IBOutlet var senderName: UILabel!
    @IBOutlet var sendingTime: UILabel!
    @IBOutlet var senderImage: UIImageView!
    @IBOutlet var sendingContent: UIView!
    @IBOutlet var noOfViews: UILabel!
    @IBOutlet var goForExpandButton: UIButton!
    
    @IBOutlet var feedBackView: UIView!
    
    
    override func awakeFromNib(){
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }


}
