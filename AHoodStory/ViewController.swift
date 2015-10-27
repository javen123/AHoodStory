//
//  ViewController.swift
//  AHoodStory
//
//  Created by Jim Aven on 10/26/15.
//  Copyright © 2015 Jim Aven. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataService.instance.loadPosts()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onPostsLoaded:", name: "POSTLOADED", object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = DataService.instance.loadedPosts[indexPath.row]
        //check to see if let is required
        let cell = tableView.dequeueReusableCellWithIdentifier("postCell") as? PostCell
        cell!.configureCell(post)
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 87
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPosts.count
    }
    
    func onPostsLoaded(notif:AnyObject) {
        self.tableView.reloadData()
    }

}

