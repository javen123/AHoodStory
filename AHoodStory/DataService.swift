//
//  DataService.swift
//  AHoodStory
//
//  Created by Jim Aven on 10/27/15.
//  Copyright © 2015 Jim Aven. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    
    static let instance = DataService()
    
    let KEY_POSTS = "POSTS"
    
    private var _loadedPosts = [Post]()
    
    var loadedPosts:[Post] {
        return _loadedPosts
    }
    
    func savePosts() {
        
        let postData = NSKeyedArchiver.archivedDataWithRootObject(self._loadedPosts)
        NSUserDefaults.standardUserDefaults().setObject(postData, forKey: self.KEY_POSTS)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadPosts() {
        
        if let postData = NSUserDefaults.standardUserDefaults().objectForKey(self.KEY_POSTS) as? NSData {
            if let postArray = NSKeyedUnarchiver.unarchiveObjectWithData(postData) as? [Post] {
                self._loadedPosts = postArray
            }
        }
        
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "POSTLOADED", object: nil))
    }
    
    func saveImgAndCreatePath(image:UIImage) -> String {
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "img\(NSDate.timeIntervalSinceReferenceDate())"
        let fullPath = documentsPathForFileName(imgPath)
        imgData?.writeToFile(fullPath, atomically: true)
        return imgPath
    }
    
    func imgForPath(path:String) -> UIImage? {
        
        let fullPath = documentsPathForFileName(path)
        let img = UIImage(named: fullPath)
        return img!
    }
    
    func addPost(post:Post) {
        
        self._loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
    
    func documentsPathForFileName(name:String) -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.stringByAppendingPathComponent(name)
    }
}
