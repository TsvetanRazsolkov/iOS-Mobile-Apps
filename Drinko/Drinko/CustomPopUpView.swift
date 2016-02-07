//
//  CustomPopUpView.swift
//  Drinko
//
//  Created by Tsvetan Razsolkov on 2/7/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

import UIKit;

class CustomPopUpView: UIViewController {
    @IBOutlet weak var popUpView: UIView!

    var isActive : Bool
    
    @IBAction func closePopUpView(sender: AnyObject) {        
        isActive = false
        self.removeAnimate()
    }
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var labelMessage: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        self.popUpView.layer.cornerRadius = 5
        self.popUpView.layer.shadowOpacity = 0.8
        self.popUpView.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        // Do any additional setup after loading the view.
    }
    
    required init?(coder aDecoder: NSCoder) {
        isActive = false
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        isActive = false
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkIfActive() -> Bool{
        return isActive;
    }

    func showInView(aView: UIView!, withMessage message: String!, andButtonText buttonText: String!, animated: Bool)
    {
        isActive = true
        aView.addSubview(self.view)
        labelMessage!.text = message
        labelMessage!.textAlignment = NSTextAlignment.Center
        labelMessage!.font = UIFont(name: "Marker Felt", size: 35)
        labelMessage!.textColor = UIColor.redColor()
        btnClose!.setTitle(buttonText, forState: .Normal)
        if animated
        {
            self.showAnimate()
        }
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
        self.view.alpha = 0.0;
        UIView.animateWithDuration(0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animateWithDuration(0.25, animations: {
            self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
            self.view.alpha = 0.0;
            }, completion:{(finished : Bool)  in
                if (finished)
                {
                    self.view.removeFromSuperview()
                }
        });
    }
}
