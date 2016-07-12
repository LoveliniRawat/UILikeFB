//
//  DetailViewController.swift
//  FBCardView
//
//  Created by Lovelini Rawat on 6/10/16.
//  Copyright © 2016 DemoBangMobile. All rights reserved.
//
import Foundation
import UIKit

class DetailViewController: UIViewController ,UIGestureRecognizerDelegate {
    
    @IBOutlet var detailView: UIView!
    @IBOutlet var activityTab: UIView!
    var contentImage : UIImage?
    var contentImageView : UIImageView!
    var counter: Int = 0

    
    override func viewDidLoad(){
        
        var starButton: DOFavoriteButton = DOFavoriteButton()
        var heartButton: DOFavoriteButton = DOFavoriteButton()
        var likeButton: DOFavoriteButton = DOFavoriteButton()
        var smileButton: DOFavoriteButton = DOFavoriteButton()
        
        
        
        let width = (self.view.frame.width - 44) / 4
        var x = width / 2
        let y = self.view.frame.height / 2 + 290
        
        
        
        
        // star button
        starButton = DOFavoriteButton(frame: CGRectMake(x, y, 44,44), image: UIImage(named: "star"))
        starButton.addTarget(self, action: Selector("tappedButton:"), forControlEvents: UIControlEvents.TouchUpInside)
        //self.view.addSubview(starButton)
        x += width
        
        // heart button
        heartButton = DOFavoriteButton(frame: CGRectMake(x, y, 44, 44), image: UIImage(named: "heart"))
        heartButton.imageColorOn = UIColor(red: 254/255, green: 110/255, blue: 111/255, alpha: 1.0)
        heartButton.circleColor = UIColor(red: 254/255, green: 110/255, blue: 111/255, alpha: 1.0)
        heartButton.lineColor = UIColor(red: 226/255, green: 96/255, blue: 96/255, alpha: 1.0)
        heartButton.addTarget(self, action: Selector("tappedButton:"), forControlEvents: UIControlEvents.TouchUpInside)
        //self.view.addSubview(heartButton)
        x += width
        
        // like button
        likeButton = DOFavoriteButton(frame: CGRectMake(x, y, 44, 44), image: UIImage(named: "like"))
        likeButton.imageColorOn = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        likeButton.circleColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        likeButton.lineColor = UIColor(red: 41/255, green: 128/255, blue: 185/255, alpha: 1.0)
        likeButton.addTarget(self, action: Selector("tappedButton:"), forControlEvents: UIControlEvents.TouchUpInside)
        //self.view.addSubview(likeButton)
        x += width
        
        // smile button
        smileButton = DOFavoriteButton(frame: CGRectMake(x, y, 44, 44), image: UIImage(named: "smile"))
        smileButton.imageColorOn = UIColor(red: 45/255, green: 204/255, blue: 112/255, alpha: 1.0)
        smileButton.circleColor = UIColor(red: 45/255, green: 204/255, blue: 112/255, alpha: 1.0)
        smileButton.lineColor = UIColor(red: 45/255, green: 195/255, blue: 106/255, alpha: 1.0)
        smileButton.addTarget(self, action: Selector("tappedButton:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(starButton)
        self.view.addSubview(likeButton)
        self.view.addSubview(smileButton)
        self.view.addSubview(heartButton)
        
        print("content image is ",self.contentImage)
        self.contentImageView = UIImageView(frame:CGRectMake(0, 0, 400, 400));
        self.contentImageView.backgroundColor = UIColor.blackColor()
        self.detailView.backgroundColor = UIColor.blackColor()
        detailView.addSubview(self.contentImageView!)
        contentImageView?.image = contentImage
        self.contentImageView.contentMode = .ScaleToFill
        
        self.navigationController?.navigationBarHidden = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("imageTapped"))
        tapGesture.cancelsTouchesInView = true
        contentImageView.addGestureRecognizer(tapGesture)
        contentImageView.userInteractionEnabled = true
        
        
    }
    
    func tappedButton(sender: DOFavoriteButton) {
        if sender.selected {
            sender.deselect()
        } else {
            sender.select()
        }
    }
    
    func imageTapped()
    {
        print("Tapped on Image")
        
          self.navigationController?.popViewControllerAnimated(true)
        
        
    
    }

}
