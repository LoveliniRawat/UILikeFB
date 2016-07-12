//
//  AppDelegate.swift
//  FBCardView
//
//  Created by Lovelini Rawat on 6/8/16.
//  Copyright © 2016 DemoBangMobile. All rights reserved.
//

import UIKit
import CoreData
import KeychainSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        let keyChain = KeychainSwift()
       
        let blogcounter :  String =  String(0)
        let blog2counter : String = String(0)
        let blog3counter : String = String(0)
        let newscounter : String =  String(0)
        let news2counter : String = String(0)
        let news3counter : String = String(0)
        
        keyChain.set(blogcounter , forKey: "blogCounter")
        keyChain.set(newscounter , forKey: "newsCounter")
        keyChain.set(blog2counter , forKey: "blog2Counter")
        keyChain.set(news3counter , forKey: "news2Counter")
        keyChain.set(blog3counter , forKey: "blog3Counter")
        keyChain.set(news3counter , forKey: "news3Counter")
        
        
        let senderImage1: UIImage  = UIImage(named:"sender1")!
        let senderImage2: UIImage  = UIImage(named:"sender2")!
        let senderImage3: UIImage  = UIImage(named:"sender3")!
        let senderImage4: UIImage  = UIImage(named:"sender4")!
       
        
        let image1: UIImage  = UIImage(named:"image01")!
        let image2: UIImage  = UIImage(named:"image02")!
        let image3: UIImage  = UIImage(named:"image03")!
        let image4: UIImage  = UIImage(named:"image04")!
        

        
        let viewCounter1 :  String =  String(0)
        let viewCounter2 : String = String(0)
        let viewCounter3 : String = String(0)
        let viewCounter4 : String =  String(0)
        
        let senderName1 :  String =  String("Jennifer Kristensen")
        let senderName2 : String = String("Donte Stewart")
        let senderName3 : String = String("Genie Davis")
        let senderName4 : String =  String("julie haralson")
        
        let sendingDesc1 :  String =  "03:33 pm"
        let sendingDesc2 : String = "03:33 pm"
        let sendingDesc3 : String = "03:33 pm"
        let sendingDesc4 : String =  "03:33 pm"
        
        
        

        var contentArrays1: NSMutableArray = []
        
        contentArrays1 = [viewCounter1, viewCounter2, viewCounter3, viewCounter4]
        //contentArrays2 = [content1, content2, content3, content4]
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        
        //Setting the content tint of the Status Bar
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        application.statusBarHidden = true
        
        //NSUserDefaults.standardUserDefaults().setObject(contentArrays2, forKey: "contentArray")
        //NSUserDefaults.standardUserDefaults().synchronize()
        
        defaults.setObject(contentArrays1, forKey: "viewArray")
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "BangMobileDI.FBCardView" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("FBCardView", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason

            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }

}

