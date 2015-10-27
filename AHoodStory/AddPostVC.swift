//
//  AddPostVC.swift
//  AHoodStory
//
//  Created by Jim Aven on 10/26/15.
//  Copyright © 2015 Jim Aven. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var descText: UITextField!
    @IBOutlet weak var postImg: UIImageView!
    
    var imgPicker:UIImagePickerController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.postImg.layer.cornerRadius = self.postImg.frame.width / 2
        self.postImg.clipsToBounds = true
        
        self.imgPicker = UIImagePickerController()
        self.imgPicker.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func btnMakePostPressed(sender: AnyObject) {
        if let title = self.titleText.text, let desc = self.descText.text, let img = self.postImg.image {
            
            let imgPath = DataService.instance.saveImgAndCreatePath(img)
            
            let post = Post(imagePath: imgPath, title: title, desc: desc)
            DataService.instance.addPost(post)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        else {
            let alert = UIAlertController(title: "Oops", message: "All fields must be filled", preferredStyle: UIAlertControllerStyle.Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alert.addAction(cancelAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }

    @IBAction func btnAddPicPressed(sender: UIButton) {
        
        sender.setTitle("", forState: .Normal)
        self.presentViewController(self.imgPicker, animated: true, completion: nil)
    }
    
    @IBAction func btnCancelPressed(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        self.imgPicker.dismissViewControllerAnimated(true, completion: nil)
        self.postImg.image = image
    }
    
}
