//
//  PostingCell.swift
//  FBCardView
//
//  Created by Lovelini Rawat on 6/14/16.
//  Copyright © 2016 DemoBangMobile. All rights reserved.
//

import UIKit

class PostingCell: UITableViewCell {
    
   
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var postingText: UITextView!
    @IBOutlet var camera: UIButton!
    @IBOutlet var postingButton: UIButton!
    @IBOutlet var statusText: UITextView!
    
    @IBOutlet var searchingIcon: UIImageView!
    
    @IBOutlet var groupIcon: UIImageView!
    
    @IBOutlet var listIcon: UIImageView!
    
    @IBOutlet var imageToBePosted: UIImageView!

    @IBOutlet var earthSIgn: UIImageView!
    override func awakeFromNib(){
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }


}
