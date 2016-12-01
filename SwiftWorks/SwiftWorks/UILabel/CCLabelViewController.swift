//
//  CCLabelViewController.swift
//  SwiftWorks
//
//  Created by Medalands on 15/4/23.
//  Copyright (c) 2015年 Medalands. All rights reserved.
//

import UIKit

class CCLabelViewController: YFBaseViewController {

    var textLabel:UILabel = UILabel.init()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
//        let textLabel:UILabel = UILabel(frame: CGRectMake(15, 100, self.view.frame.size.width - 30, 300))

        textLabel.frame = CGRect(x: 15, y: 100, width: self.view.frame.size.width - 30, height: 300)
        
        textLabel.text = "现在我们来开始学习如何创建我们的第一个swift控件吧 -UILabel"
        
        textLabel.numberOfLines = 0
        
        textLabel.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        textLabel.textAlignment = NSTextAlignment.left
        
        textLabel.font = UIFont.systemFont(ofSize: 25)
        
        textLabel.textColor = UIColor.green
        
        self.view.addSubview(textLabel)

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
