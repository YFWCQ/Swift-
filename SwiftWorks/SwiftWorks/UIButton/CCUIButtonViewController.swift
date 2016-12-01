//
//  CCUIButtonViewController.swift
//  SwiftWorks
//
//  Created by Medalands on 15/4/23.
//  Copyright (c) 2015年 Medalands. All rights reserved.
//

import UIKit

class CCUIButtonViewController: YFBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
//        let button:UIButton = UIButton.buttonWithType(UIButtonType.Custom)
//        
//        button.frame = CGRectMake(15, 100, self.view.frame.size.width - 30, 300)
//        
//        button.setTitle("我是一个button 你看什么看 有种咬我", forState: UIControlState.Normal)
//        
//        button.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), forState: UIControlState.Normal)
//        
//        button.addTarget(self, action:"buttonAction:" , forControlEvents: UIControlEvents.TouchUpInside)
//        
//        self.view.addSubview(button);
        
    }

    func buttonAction(_ sender:UIButton)
    {
        print("hello world")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
