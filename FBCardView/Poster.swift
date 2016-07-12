//
//  Poster.swift
//  FBCardView
//
//  Created by Lovelini Rawat on 6/14/16.
//  Copyright © 2016 DemoBangMobile. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import FontAwesome
import KeychainSwift




var imagePicker: UIImagePickerController!

class Poster: UITableViewController , PlayerDelegate, UIGestureRecognizerDelegate,UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    
    private var player: Player!
    var viewCounter1: Int!
    var viewCounter2: Int!
    var viewCounter3: Int!
    var viewCounter4: Int!
    var statusText:String!
    var newPosterImage:UIImage!
    var readyForPost: Bool!
    
   
    var viewCounterString1: String!
    var viewCounterString2: String!
    var viewCounterString3: String!
    var viewCounterString4: String!
    
    var starButton: DOFavoriteButton = DOFavoriteButton()
    var heartButton: DOFavoriteButton = DOFavoriteButton()
    var likeButton: DOFavoriteButton = DOFavoriteButton()
    var smileButton: DOFavoriteButton = DOFavoriteButton()
    
    var avPlayController = AVPlayerViewController()
    
    var contentArrays: NSMutableArray = []
    var tapImge:UITapGestureRecognizer = UITapGestureRecognizer()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
                let keychain = KeychainSwift()
        
                self.newPosterImage = nil
                self.statusText = "Whats In Your Mind"
        
                self.navigationController?.navigationBarHidden = true
        
//                if var ImageCounter : Int? = Int(keychain.get("viewCounter1")!) {
//        
//                    self.viewCounterString1 = String(ImageCounter)
//                    print(self.viewCounterString1)
//        
//                }
//        
//                if var ImageCounter : Int? = Int(keychain.get("viewCounter2")!) {
//        
//        
//                    self.viewCounterString2 = String(ImageCounter)
//                    print(self.viewCounterString2)
//        
//        
//                }
//        
//                if var ImageCounter : Int? = Int(keychain.get("viewCounter3")!) {
//        
//                    self.viewCounterString3 = String(ImageCounter)
//                    print(self.viewCounterString3)
//        
//        
//                }
//                if var ImageCounter : Int? = Int(keychain.get("viewCounter4")!) {
//        
//                    self.viewCounterString4 = String(ImageCounter)
//                    print(self.viewCounterString4)
//        
//                }
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let array = defaults.objectForKey("viewArray") as? [String]
        
        for key in array! {
            
            print("key is",key)
            
        }
       
        
         //for content in (contentArrays as! [AnyObject])!{
        
        let image1: UIImage  = UIImage(named:"image01")!
        let image2: UIImage  = UIImage(named:"image02")!
        let image3: UIImage  = UIImage(named:"image03")!
        let image4: UIImage  = UIImage(named:"image04")!
        let image5: UIImage  = UIImage(named:"image05")!
        
        
        let content1: NSMutableDictionary = ["section" : 0, "senderName" : "Jennifer Kristensen", "senderImage": "sender1","sendingDesc": "03:33 pm","videoUrl": "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4","isVedio": "true","posterStatus":"Keywords: poetic, water, colour, abstract, Karen van de Vliet, leaves, nature","onlyMessage": "no"]
        
        let content2 : NSMutableDictionary = ["section" : 1, "senderName" : "Donte Stewart", "senderImage": "sender2", "sendingContent": image4,"sendingDesc": "03:33 pm","videoUrl": "","isVedio": "false","posterStatus":"Keywords: poetic, water, colour, abstract, Karen van de Vliet, leaves, nature","onlyMessage": "no"]
        
        let content3: NSMutableDictionary = ["section" : 2, "senderName" : "Genie Davis", "senderImage": "sender3", "sendingContent": image1,"sendingDesc": "08:33 pm","videoUrl": "","isVedio": "false","posterStatus":"Keywords: poetic, water, colour, abstract, Karen van de Vliet, leaves, nature","onlyMessage": "no"]
        
//        let content4: NSMutableDictionary  = ["section" : 3, "senderName" : "julie haralson", "senderImage": "sender4", "sendingContent": image4,"sendingDesc": "09:33 pm","videoUrl": "","isVedio": "false","posterStatus":"Keywords: poetic, water, colour, abstract, Karen van de Vliet, leaves, nature","onlyMessage": "no"]
        
        
        self.contentArrays = [content1, content2, content3]
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    
        
        self.viewCounter1 = 0
        self.viewCounter2 = 0
        self.viewCounter3 = 0
        self.viewCounter4 = 0
        
        
    for index in 0...contentArrays.count - 1{
            
            if var content : NSMutableDictionary = contentArrays[index] as! NSMutableDictionary{
                
                print("addind countere dynamically")
                
                content["viewCounter"] = array![index]
                
            }
        
  }
        
                // isBlogSelected = false
                //        isNewsSelected = false
                //        imageList = ["image01", "image02", "image03", "image04","image05","image06","image07"]
                //        senderImageList = ["sender1", "sender2", "sender3", "sender4","sender5","sender6","sender7"]
                //        senderName = ["Jennifer Kristensen", "Donte Stewart ", "Genie Davis", "julie haralson","Jeanette Lafontine","Nalia Trin","Andy Allen"]
        
        
//                var contentArraysnew: NSMutableArray = []
//                for index in 0...contentArrays.count-1 {
//                    
//                    print("index value is.....",index)
//                    
//                    if let content1 : NSMutableDictionary = contentArrays[index] as! NSMutableDictionary  {
//                        
//                       content1["viewCounter"] = array![index]
//                       contentArraysnew.addObject(content1)
//                        
//                    }
//                    
//                    
//                }

                self.tableView.reloadData()
            }
            func tappedButton(sender: DOFavoriteButton) {
                
                if sender.selected {
                    sender.deselect()
                } else {
                    sender.select()
                }
                
                
         //self.requestObservers()
         self.navigationController?.navigationBarHidden = true

        
    }
    
    
    override func viewDidAppear(animated: Bool) {
    
        
        print("viewDidAppear called")
        
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let array = defaults.objectForKey("viewArray") as? [String]
        
        var contentArraysNew: NSMutableArray = []
        
    for index in 0...contentArrays.count - 1{

            
            if var content : NSMutableDictionary = contentArrays[index] as? NSMutableDictionary{
            
                var count: String =  array![index]
                content.setObject(count, forKey: "viewCounter")
                
            }
            
        }

        self.tableView.reloadData()
    }
//    func tappedButton(sender: DOFavoriteButton) {
//        
//        if sender.selected {
//            sender.deselect()
//        } else {
//            sender.select()
//        }
//        
//    }
    
    
    // MARK: UIGestureRecognizer
    
    func handleTapGestureRecognizer(gestureRecognizer: UITapGestureRecognizer) {
        
        switch (self.player.playbackState.rawValue) {
        case PlaybackState.Stopped.rawValue:
            self.player.playFromBeginning()
        case PlaybackState.Paused.rawValue:
            self.player.playFromCurrentTime()
        case PlaybackState.Playing.rawValue:
            self.player.pause()
        case PlaybackState.Failed.rawValue:
            self.player.pause()
        default:
            self.player.pause()
        }
    }
    
    
    // MARK: PlayerDelegate
    
    func playerReady(player: Player) {
    }
    
    func playerPlaybackStateDidChange(player: Player) {
    }
    
    func playerBufferingStateDidChange(player: Player) {
    }
    
    func playerPlaybackWillStartFromBeginning(player: Player) {
    }
    
    func playerPlaybackDidEnd(player: Player) {
    }
    
    func playerCurrentTimeDidChange(player: Player) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        
        return 1;
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        var count = self.contentArrays.count + 1
        
        return count
    }
    
    @IBAction func cameraSelected(sender: UIButton) {
        
        let actionSheet = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .ActionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .Default) { (action) -> Void in
                imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
            actionSheet.addAction(cameraAction)
        }
        
        let albumAction = UIAlertAction(title: "Photo Library", style: .Default) { (action) -> Void in
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        
        actionSheet.addAction(albumAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        actionSheet.addAction(cancelAction)
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
        
    }
    
    //    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
    //
    //        picker.dismissViewControllerAnimated(true, completion: nil)
    //        //imagePicked!.image = image
    //  }
    
    
    
    // *Overide
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
//        
//        picker.dismissViewControllerAnimated(true, completion: nil)
//        
//        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            
//            let resizedImage = resizeImage(pickedImage, newWidth: 200)
//             print("resized Image is ",resizedImage)
//           // numberOfSections = numberOfSections + 1
//            
//        }
//        
//    }
    
    
    // *Overide
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    
        print("indexpath value:",indexPath.row)
        
        var  width : CGFloat = 0
        var  x : CGFloat = 0
        var y : CGFloat  = 0
        
        let cellIdentifier = "postingCell"
        let cellIdentifier1 = "poster"
        let cell = UITableViewCell()
        
        if(indexPath.row == 0){
            
            let postingCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! PostingCell

            postingCell.postingText.delegate = self
            
            if(self.statusText == nil || self.statusText == " " ){
                
                
                print("status text is nil")
                self.statusText = "Whats In Your Mind"
            }
            postingCell.postingText.text = self.statusText
            //postingCell.postingText.textColor = UIColor.lightGrayColor()
            postingCell.imageToBePosted.image = self.newPosterImage
            
            
            postingCell.statusText.delegate = self
            postingCell.postingButton.addTarget(self, action: "sendPost:", forControlEvents: UIControlEvents.TouchUpInside)
            print("index value for user cell is",indexPath.row)
            
              postingCell.searchingIcon.image = UIImage.fontAwesomeIconWithName(FontAwesome.Globe, textColor: UIColor.whiteColor(), size: CGSizeMake(4000, 4000), backgroundColor: UIColor.clearColor())
            
              postingCell.groupIcon.image = UIImage.fontAwesomeIconWithName(FontAwesome.Group, textColor: UIColor.whiteColor(), size: CGSizeMake(4000, 4000), backgroundColor: UIColor.clearColor())
            
              postingCell.listIcon.image = UIImage.fontAwesomeIconWithName(FontAwesome.List, textColor: UIColor.whiteColor(), size: CGSizeMake(4000, 4000), backgroundColor: UIColor.clearColor())
            
            // postingCell.earthSIgn.image = UIImage.fontAwesomeIconWithName(FontAwesome.Globe, textColor: UIColor.whiteColor(), size: CGSizeMake(4000, 4000), backgroundColor: UIColor.clearColor())
            
            return postingCell
            
        }else{
            
            let posterCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier1, forIndexPath: indexPath) as! PosterCell
            
           
            
                var posterImage = UIImageView()
                var index =  contentArrays.count - indexPath.row
                print("index value for poster cell",index)
                print("view counter value is ",contentArrays[index]["viewCounter"] as! String)
                var image : String  = contentArrays[index]["senderImage"] as! String
                  posterCell.senderImage.image = UIImage(named:image)
            
            
            

                var name : String = contentArrays[index]["senderName"] as! String
                posterCell.senderName.text = contentArrays[index]["senderName"] as! String
            
            
            
                                var viewCounter : String = (contentArrays[index]["viewCounter"] as! String)
                posterCell.posterStatus.text = (contentArrays[index]["posterStatus"] as! String)
               // print("index value is",index)
                posterCell.sendingTime.text = contentArrays[index]["sendingDesc"] as! String
                var noOfView : String
                noOfView = viewCounter
            
                posterCell.noOfViews.text = viewCounter
            
               var videoBool : String = contentArrays[index]["isVedio"] as! String
            
               if(videoBool == "false"){
                
                width = (posterCell.frame.width - 44) / 4
                
                 x = width / 2
                
                 y = posterCell.frame.height / 2 + 195

                
                let checkForOnlyMesssage = contentArrays[index]["onlyMessage"] as! String
                
                if (checkForOnlyMesssage == "no"){
                    
                    posterCell.viewLabel.alpha = 1.0
                    posterCell.noOfViews.alpha = 1.0
                    
                    posterImage.frame = CGRectMake(0,0,posterCell.sendingContent.frame.width+10,posterCell.sendingContent.frame.height)
                    
                    let image1: UIImage? = contentArrays[index]["sendingContent"] as! UIImage
                    posterImage.image = image1
                    
                    posterCell.goForExpandButton.tag = index;
                    posterCell.sendingContent.addSubview(posterCell.goForExpandButton)
                    
                    posterCell.sendingContent.addSubview(posterImage)
                    posterCell.goForExpandButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
                    
                   // return posterCell
                    
                }else{
                    
                    width = (posterCell.frame.width - 44) / 4
                    
                     x = width / 2
                    
                     y = posterCell.frame.height / 2  - 200
                    
                    //posterCell.feedBackView.frame = CGRectMake(0,0,600,41)
                    //posterCell.contentView.addSubview(posterCell.feedBackView)

                    
                    posterCell.viewLabel.alpha = 0.0
                    posterCell.noOfViews.alpha = 0.0
                    
                    posterCell.senderName.text = contentArrays[index]["senderName"] as! String
                                                 + " "+"wrote on her Timeline"
                    
                    //return posterCell
                }
        
                
                
             }else if (videoBool == "true"){
                
                
                 width = (posterCell.frame.width - 44) / 4
                
                 x = width / 2
                
                y = posterCell.frame.height / 2 + 195

                
                if(index == 3){
                    
                    print("inside Video")
                    
                }
                
                posterCell.viewLabel.alpha = 0.0
                posterCell.noOfViews.alpha = 0.0
                
                let videoURL = NSURL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
                let avplayer = AVPlayer(URL: videoURL!)
                //let controller = AVPlayerViewController()
                self.avPlayController.player = avplayer
                
                //let playerLayer = AVPlayerLayer(player: player)
                self.avPlayController.view.frame = CGRectMake(0,0,posterCell.sendingContent.frame.width + 20, posterCell.sendingContent.frame.height)
                //posterCell.sendingContent.bounds
                posterCell.sendingContent.addSubview(self.avPlayController.view)
                posterCell.userInteractionEnabled = true
                //posterCell.sendingContent.userInteractionEnabled = true
                posterCell.goForExpandButton.userInteractionEnabled = true
                //player.play()
                //return posterCell
                
            }
            
            
//            if let checkForMessage : String = contentArrays[index]["onlyMessage"] as! String{
//
//                if(checkForMessage == "yes"){
//                    
//                    
//                    posterCell.senderImage.image = nil
//                    
//                }else{
//                    
//                    posterImage.frame = CGRectMake(0,0,posterCell.sendingContent.frame.width+10,posterCell.sendingContent.frame.height)
//                    
//                    let image1: UIImage? = contentArrays[index]["sendingContent"] as! UIImage
//                    posterImage.image = image1
//                    
//                    posterCell.sendingContent.addSubview(posterImage)
//                    
//                }
//                
//            }
//            

//                var videoBool : String = contentArrays[index]["isVedio"] as! String
//            
//                if(videoBool == "true"){
//                    
//                let videoURL = NSURL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
//                                let avplayer = AVPlayer(URL: videoURL!)
//                                //let controller = AVPlayerViewController()
//                                self.avPlayController.player = avplayer
//                
//                                //let playerLayer = AVPlayerLayer(player: player)
//                                self.avPlayController.view.frame = CGRectMake(0,0,posterCell.sendingContent.frame.width + 20, posterCell.sendingContent.frame.height)
//                                //posterCell.sendingContent.bounds
//                                posterCell.sendingContent.addSubview(self.avPlayController.view)
//                                posterCell.userInteractionEnabled = true
//                                //posterCell.sendingContent.userInteractionEnabled = true
//                                //posterCell.goForExpandButton.userInteractionEnabled = false
//                                //player.play()
//                               // return posterCell
//
//                
//                
//            }
            
              //  print("videoUrl is", videoUrl)
//            
//                if(videoUrl.characters.count >= 1){
//                
//                let videoURL = NSURL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
//                let avplayer = AVPlayer(URL: videoURL!)
//                //let controller = AVPlayerViewController()
//                self.avPlayController.player = avplayer
//             
//                //let playerLayer = AVPlayerLayer(player: player)
//                self.avPlayController.view.frame = CGRectMake(0,0,posterCell.sendingContent.frame.width + 20, posterCell.sendingContent.frame.height)
//                //posterCell.sendingContent.bounds
//                posterCell.sendingContent.addSubview(self.avPlayController.view)
//                posterCell.userInteractionEnabled = true
//                //posterCell.sendingContent.userInteractionEnabled = true
//                //posterCell.goForExpandButton.userInteractionEnabled = false
//                //player.play()
//                return posterCell
//                
//                
//                }else{
//                
                //var image = contentArrays[index]["sendingContent"] as! String
            
            
            
            
            
            
             //                if let image : UIImage = contentArrays[index]["sendingContent"] as! UIImage  {
//                    
//                    posterImage.image = image
//                    
//                 }
//                
            
           // }
            
            
//                if(viewCounter != "0"){
//                    
//                    noOfView = viewCounter.substringWithRange(Range<String.Index>(start:          viewCounter.startIndex.advancedBy(9), end: viewCounter.endIndex.advancedBy(-1)))
//                }
            
            
            
            
            
            
            // star button
            
            starButton = DOFavoriteButton(frame: CGRectMake(x, y, 44, 44), image: UIImage(named: "star"))
            
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
            
            posterCell.addSubview(starButton)
            
            posterCell.addSubview(likeButton)
            
            posterCell.addSubview(smileButton)
            
            posterCell.addSubview(heartButton)
            
            return posterCell

        
            
            
        }
    
        return cell
        
    }
    
    func textViewDidEndEditing(textView: UITextView) {
    
        
        self.statusText = textView.text
        print("textr is ",self.statusText)
    }
    func ImageTapped()
        
    {
        
        print("Tapped on Image")
    
        let keychain = KeychainSwift()

        
        if var blogImageCounter : Int? = Int(keychain.get("viewCounter1")!) {
            
            viewCounter1 = blogImageCounter
            
            viewCounter1 = viewCounter1 + 1
            
            var blogcounter = String(viewCounter1)
            
            keychain.set(blogcounter , forKey: "viewCounter1")
            
            // isBlogSelected = true
            
            
        }
        
        
        
        let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("detailedView") as? DetailViewController
        
        //nextViewController!.contentImage = poster1
        
        
        
        self.navigationController!.pushViewController(nextViewController!, animated: false)
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        
        var returnVal : CGFloat = 0
        
               if  indexPath.row == 0 {
        
                    returnVal = 220
        
               }else {
                for index in 0...contentArrays.count - 1{
                    
                    
                    if(index ==  contentArrays.count - indexPath.row){
                        
                        print("index value is onlyMessage", index)
                        print("indexPath.row value for onlyMessage",indexPath.row)
                    print("index selected ",index)
                    
                    if var content : AnyObject = contentArrays[index] as? AnyObject{
                        
                        if(content["onlyMessage"] as? String == "yes"){
                            
                            print("onlye Message")
                            //returnVal = 500
                           returnVal = 130
                            
                        }else{
                            
                            returnVal = 500
                        }
                        
                        
                        
                       }
                        
                    }
                    
                
                
                }

                
             }
        
        return returnVal
    }
    @IBAction func sendPost(sender: AnyObject) {
        
        
        //keyChain.set(viewCounter , forKey: "viewCounter")
     
        let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
        
        print(timestamp)
        
        //            var defaults = NSUserDefaults.standardUserDefaults()
        //            var array = defaults.objectForKey("keyArray") as? [String]
        //            let counter : String = String(0)
        //            array?.append(counter)
        //            defaults.setObject(array, forKey: "keyArray")
        //
        //
        //            for key in array! {
        //
        //                print("key is after adding new content",key)
        //
        //            }
        
        var defaults = NSUserDefaults.standardUserDefaults()
        let counter : String = String(0)
        var array = defaults.objectForKey("viewArray") as? [String]
        array?.append(counter)
        defaults.setObject(array, forKey: "viewArray")
        
        print("array is ", array)
        
        var nilImage: UIImage? = nil
        
        if(self.newPosterImage == nil){
            
            if(self.statusText == "Whats In Your Mind"){
                
                
                // create the alert
                let alert = UIAlertController(title: "Post", message: "Please write Post", preferredStyle: UIAlertControllerStyle.Alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                
                // show the alert
                self.presentViewController(alert, animated: true, completion: nil)
                
                return
                
            }
            
            print("No image")
            
            let content: NSMutableDictionary = ["section" : 0, "senderName" : "Lovelini Rawat", "senderImage": "user","sendingDesc": timestamp,"videoUrl": "","isVedio": "false","posterStatus":self.statusText, "hasContent" : "none","onlyMessage": "yes"]
            self.contentArrays.addObject(content)
            
        }else{
            
            print(" Yes image")
            
            
            if(self.statusText == "Whats In Your Mind"){
                
                
                // create the alert
                let alert = UIAlertController(title: "Post", message: "Please write Post", preferredStyle: UIAlertControllerStyle.Alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                
                // show the alert
                self.presentViewController(alert, animated: true, completion: nil)
                
                return
                
            }
            

            
            let content3: NSMutableDictionary = ["section" : 2, "senderName" : "Lovelini Rawat posted on her Timeline", "senderImage": "user", "sendingContent": self.newPosterImage,"sendingDesc": "08:33 pm","videoUrl": "","isVedio": "false","posterStatus":self.statusText,"onlyMessage": "no"]
            self.contentArrays.addObject(content3)
            
        }
        
        for index in 0...contentArrays.count - 1{
            
            if var content : NSMutableDictionary = contentArrays[index] as! NSMutableDictionary{
                
                print("addind countere dynamically2")
                
                content["viewCounter"] = array![index]
                
            }
            
        }
        
        self.newPosterImage = nil
        self.statusText = "Whats In Your Mind" 
        self.tableView.reloadData()
        print("inside send post")
        

    }
    
    func buttonAction(sender:UIButton!) {
        
        //self.avPlayController.showsPlaybackControls = true
        
        print("button tapped")
      
        var btnsendtag:Int = sender.tag
        var objectValue = contentArrays.objectAtIndex(sender.tag)
        let keychain = KeychainSwift()
        //var defaults = NSUserDefaults.standardUserDefaults()
        //var array = defaults.objectForKey("viewArray") as? [String]

        let defaults = NSUserDefaults.standardUserDefaults()
        var array = defaults.objectForKey("viewArray") as? [String]
        
        print(contentArrays)
        
        for index in 0...contentArrays.count - 1{
            
            if(sender.tag == index){
                
                print("index selected ",index)
           
           if var content : AnyObject = contentArrays[index] as? AnyObject{
            
                print(content)
                var count: String =  array![index]
                var counter: Int = Int(count)!
                counter = counter + 1
                count = String(counter)
                array![index] = count
                defaults.setObject(array, forKey: "viewArray")
                print(array)
            
                }
            
            }
            
        }
        
        
        let nextViewController = self.storyboard?.instantiateViewControllerWithIdentifier("detailedView") as? DetailViewController
        
       // var image =  UIImage(named:objectValue["sendingContent"] as! String)
        
        if let image : UIImage = objectValue["sendingContent"] as! UIImage  {
            
           nextViewController!.contentImage = image
            
        }
        
        //print("image is",image)
       //print(objectValue["sendingContent"] as! String)
        self.navigationController!.pushViewController(nextViewController!, animated: false)
        
   
    }
    
    
    ///MARK: - func - to reset the image taken from camera or gallary
    /** parameter
     1) image - UserImage
     
     2) newWidth - new width for the image
     
     */
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
        image.drawInRect(CGRectMake(0, 0, newWidth, newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    @IBAction func getImageFromCameraOrGallery(sender: UIButton) {
        
        let actionSheet = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .ActionSheet)
        
        
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            
            let cameraAction = UIAlertAction(title: "Camera", style: .Default) { (action) -> Void in
                
                imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
                
                self.presentViewController(imagePicker, animated: true, completion: nil)
                
            }
            
            actionSheet.addAction(cameraAction)
            
        }
        
        
        
        let albumAction = UIAlertAction(title: "Photo Library", style: .Default) { (action) -> Void in
            
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
            
        }
        
    
        actionSheet.addAction(albumAction)
        
    
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        actionSheet.addAction(cancelAction)
        
    
        self.presentViewController(actionSheet, animated: true, completion: nil)

        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            
            let resizedImage = resizeImage(pickedImage, newWidth: 200)
            
            let keyChain = KeychainSwift()
            
            let viewCounter : String = String(0)
            
            self.newPosterImage = resizedImage
        
        }
        
     }
    
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
             self.statusText = textView.text
            //self.view.userInteractionEnabled = true
            return false
        }
         self.statusText = textView.text
        return true
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        
        
        
            //self.tableView.userInteractionEnabled = false
            self.statusText = textView.text
            textView.text = nil
            textView.textColor = UIColor.blackColor()
        
    }
    
    func textViewDidChangeEditing(textView: UITextView) {
    
       self.statusText = textView.text
    }


    
//
//    
//    // MARK: - Responders & Observers
//    
//    /**
//     Adds Observers for the keyboard.
//     */
//    private func requestObservers() {
//        
//        
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil)
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil)
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    /**
//     Removes observers for the keyboard.
//     */
//    private func releaseObservers() {
//        
//        logger.verbose("releaseObservers for TextField Executing....")
//        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
//        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    // *Override
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        
//        return true
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    /**
//     Responds to keyboard showing and adjusts the scrollview.
//     
//     :param: notification
//     Type - NSNotification
//     */
//    func keyboardWillShow(notification: NSNotification) {
//        
//        logger.verbose("Keyboard will show.")
//        
//        let info = notification.userInfo!
//        let keyboardHeight:CGFloat = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size.height
//        let duration:Double = info[UIKeyboardAnimationDurationUserInfoKey] as! Double
//        
//        // Calculate the Y value by knowing the height of the keyboard and the bottom of the screen.
//        let keyboardYValue = self.view.frame.height - keyboardHeight
//        
//        if firstName.isFirstResponder() {
//            
//            let firstNameBottomYValue = self.firstName.frame.size.height + self.firstName.frame.origin.y
//            
//            logger.debug("Email text field is the first responder.")
//            logger.debug("Email Bottom Y Value: \(firstNameBottomYValue) | Keyboard Y Value: \(keyboardYValue + 10.0)")
//            
//            if self.currentKeyboardOffset == 0.0 {
//                if firstNameBottomYValue > (keyboardYValue + 10.0) { // Keyboard y value with 10px of padding
//                    self.currentKeyboardOffset = (keyboardYValue + 10.0) - firstNameBottomYValue
//                    logger.debug("Keyboard offset: \(self.currentKeyboardOffset)")
//                    UIView.animateWithDuration(0.5, animations: { () -> Void in
//                        self.view.frame.origin.y -= self.currentKeyboardOffset
//                    })
//                }
//            }
//            
//        }else if lastName.isFirstResponder() {
//            
//            let lastNameBottomYValue = self.lastName.frame.size.height + self.lastName.frame.origin.y
//            
//            logger.debug("Password text field is the first responder.")
//            logger.debug("Password Bottom Y Value: \(lastNameBottomYValue) | Keyboard Y Value: \(keyboardYValue + 10.0)")
//            
//            if self.currentKeyboardOffset == 0.0 {
//                if (lastNameBottomYValue + 10.0) > keyboardYValue { // Keyboard y value with 10px of padding
//                    self.currentKeyboardOffset = (lastNameBottomYValue + 10.0) - keyboardYValue
//                    logger.debug("Keyboard offset: \(self.currentKeyboardOffset)")
//                    UIView.animateWithDuration(0.5, animations: { () -> Void in
//                        self.view.frame.origin.y -= self.currentKeyboardOffset
//                        
//                        }, completion: { (completed) -> Void in
//                            logger.debug("Animated View Up")
//                            
//                    })
//                }
//                
//            }
//            
//            
//        }else if emailTextField.isFirstResponder() {
//            
//            let emailBottomYValue = self.emailTextField.frame.size.height + self.emailTextField.frame.origin.y
//            
//            logger.debug("Password text field is the first responder.")
//            logger.debug("Password Bottom Y Value: \(emailBottomYValue) | Keyboard Y Value: \(keyboardYValue + 10.0)")
//            
//            if self.currentKeyboardOffset == 0.0 {
//                if (emailBottomYValue + 10.0) > keyboardYValue { // Keyboard y value with 10px of padding
//                    self.currentKeyboardOffset = (emailBottomYValue + 10.0) - keyboardYValue
//                    logger.debug("Keyboard offset: \(self.currentKeyboardOffset)")
//                    UIView.animateWithDuration(0.5, animations: { () -> Void in
//                        self.view.frame.origin.y -= self.currentKeyboardOffset
//                        
//                        }, completion: { (completed) -> Void in
//                            logger.debug("Animated View Up")
//                            
//                    })
//                }
//                
//            }
//            
//            
//        }
//            
//        else if password.isFirstResponder() {
//            
//            let passwordBottomYValue = self.password.frame.size.height + self.password.frame.origin.y
//            
//            
//            if self.currentKeyboardOffset == 0.0 {
//                if (passwordBottomYValue + 10.0) > keyboardYValue { // Keyboard y value with 10px of padding
//                    self.currentKeyboardOffset = (passwordBottomYValue + 10.0) - keyboardYValue
//                    logger.debug("Keyboard offset: \(self.currentKeyboardOffset)")
//                    UIView.animateWithDuration(0.5, animations: { () -> Void in
//                        self.view.frame.origin.y -= self.currentKeyboardOffset
//                        
//                        }, completion: { (completed) -> Void in
//                            logger.debug("Animated View Up")
//                            
//                    })
//                }
//                
//            }
//            
//            
//        }
//        else if dateTextField.isFirstResponder() {
//            
//            let dateFieldBottomYValue = self.dateTextField.frame.size.height + self.dateTextField.frame.origin.y
//            
//            logger.debug("Password text field is the first responder.")
//            logger.debug("Password Bottom Y Value: \(dateFieldBottomYValue) | Keyboard Y Value: \(keyboardYValue + 10.0)")
//            
//            if self.currentKeyboardOffset == 0.0 {
//                if (dateFieldBottomYValue + 10.0) > keyboardYValue { // Keyboard y value with 10px of padding
//                    self.currentKeyboardOffset = (dateFieldBottomYValue + 10.0) - keyboardYValue
//                    logger.debug("Keyboard offset: \(self.currentKeyboardOffset)")
//                    UIView.animateWithDuration(0.5, animations: { () -> Void in
//                        self.view.frame.origin.y -= self.currentKeyboardOffset
//                        
//                        }, completion: { (completed) -> Void in
//                            logger.debug("Animated View Up")
//                            
//                    })
//                }
//                
//            }
//            
//            
//        }
//        
//        
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//
//    
//
//
//    /**
//     Responds to keyboard hiding and adjusts the scrollview.
//     
//     :param: notification
//     Type - NSNotification
//     */
//    func keyboardWillHide(notification: NSNotification) {
//        
//        logger.verbose("Keyboard will hide.")
//        
//        if self.currentKeyboardOffset != 0.0 {
//            
//            UIView.animateWithDuration(0.5, animations: { () -> Void in
//                self.view.frame.origin.y += self.currentKeyboardOffset
//                }, completion: { (completed) -> Void in
//                    logger.debug("Animate view down.")
//                    self.currentKeyboardOffset = 0.0
//            })
//            
//        }
//    }
//    
    
}
