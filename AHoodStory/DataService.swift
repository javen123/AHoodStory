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
        
    }
    
    func loadPosts() {
        
        if let postData = NSUserDefaults.standardUserDefaults().objectForKey(self.KEY_POSTS) as? NSData {
            if let postArray = NSKeyedUnarchiver.unarchiveObjectWithData(postData) as? [Post] {
                self._loadedPosts = postArray
            }
        }
        
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "POSTLOADED", object: nil))
    }
    
    func saveImgAndCreatePath(image:UIImage) {
        
        
        
    }
    
    func imgForPath(path:String){
        
        
    }
    
    func addPost(post:Post) {
        
        self._loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
    
    func documentsPathForFileName(name:String) -> String {
        
        
        
        
    }
}
