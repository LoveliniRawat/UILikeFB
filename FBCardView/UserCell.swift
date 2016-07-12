//
//  UserCell.swift
//  FBCardView
//
//  Created by Lovelini Rawat on 6/8/16.
//  Copyright © 2016 DemoBangMobile. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    
    @IBOutlet var userStatus: UITextView!
   
    @IBOutlet var userImage: UIImageView!

    @IBOutlet var postButtton: UIButton!
    
    
    override func awakeFromNib(){
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }
}
