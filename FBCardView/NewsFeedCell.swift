//
//  NewsFeedCell.swift
//  FBCardView
//
//  Created by Lovelini Rawat on 6/8/16.
//  Copyright © 2016 DemoBangMobile. All rights reserved.
//

import UIKit

class NewsFeedCell: UITableViewCell {
    
    
    @IBOutlet var senderImage: UIImageView!
    @IBOutlet var senderName: UILabel!
    @IBOutlet var sendingTime: UILabel!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var newsLabel: UILabel!

    @IBOutlet var viewsLabel: UILabel!
    @IBOutlet var shareButton: UIButton!
    @IBOutlet var commentBUtton: UIButton!
    @IBOutlet var sendingContent: UIImageView!
    
    override func awakeFromNib(){
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }
}
