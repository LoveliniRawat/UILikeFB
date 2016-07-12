//
//  BlogsCell.swift
//  FBCardView
//
//  Created by Lovelini Rawat on 6/8/16.
//  Copyright © 2016 DemoBangMobile. All rights reserved.
//

import UIKit

class BlogsCell: UITableViewCell {
    
    @IBOutlet var senderImage: UIImageView!
    @IBOutlet var sendingTime: UILabel!
    @IBOutlet var senderName: UILabel!
    @IBOutlet var sendingContent: UIImageView!
    @IBOutlet var sendingDesc: UITextView!
    @IBOutlet var viewsLabel: UILabel!
    
    @IBOutlet var shareButton: UIButton!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var commentBtn: UIButton!
    
    @IBOutlet var sendingContentVie: UIView!
    override func awakeFromNib(){
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }
    
}
