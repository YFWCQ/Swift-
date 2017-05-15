//
//  FYGetSetViewController.swift
//  SwiftWorks
//
//  Created by Medalands on 15/7/27.
//  Copyright (c) 2015年 Medalands. All rights reserved.
//

import UIKit

class FYGetSetViewController: UIViewController {
    var modle:FYLoveModel = FYLoveModel.init()

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        print(modle.title ?? "")

        modle.title = "12"
        
        print(modle.title ?? "")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
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
