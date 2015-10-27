//
//  PostCell.swift
//  AHoodStory
//
//  Created by Jim Aven on 10/26/15.
//  Copyright © 2015 Jim Aven. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    
    @IBOutlet weak var postImg:UIImageView!
    @IBOutlet weak var titleLbl:UILabel!
    @IBOutlet weak var descLbl:UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.postImg.layer.cornerRadius = self.postImg.frame.width / 2
        self.postImg.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell (post:Post) {
        self.titleLbl.text = post.title
        self.descLbl.text = post.postDesc
        self.postImg.image = DataService.instance.imgForPath(post.imagePath)
    }

}
