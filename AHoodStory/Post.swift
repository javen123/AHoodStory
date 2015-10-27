//
//  Post.swift
//  AHoodStory
//
//  Created by Jim Aven on 10/26/15.
//  Copyright © 2015 Jim Aven. All rights reserved.
//

import Foundation

class Post:NSObject, NSCoding {
    
    private var _imagePath:String!
    private var _title:String!
    private var _postDesc:String!
    
    var imagePath:String {
        return _imagePath
    }
    
    var title:String {
        return _title
    }
    
    var postDesc:String {
        return _postDesc
    }
    
    
    init(imagePath:String, title:String, desc:String) {
        self._imagePath = imagePath
        self._title = title
        self._postDesc = desc
    }
    
    override init() {
        
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = aDecoder.decodeObjectForKey("IMAGEPATH") as? String
        self._title = aDecoder.decodeObjectForKey("TITLE") as? String
        self._postDesc = aDecoder.decodeObjectForKey("DESC") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(self._imagePath, forKey: "IMAGEPATH")
        aCoder.encodeObject(self._postDesc, forKey: "DESC")
        aCoder.encodeObject(self._title, forKey: "TITLE")
    }
    
}
