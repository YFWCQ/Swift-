//
//  CCBlockViewController.swift
//  SwiftWorks
//
//  Created by Medalands on 15/4/28.
//  Copyright (c) 2015年 Medalands. All rights reserved.
//

import UIKit


class CCBlockViewController: YFBaseViewController {

    var model:CCBlockModel = CCBlockModel.init()
    
    var ocModel:OCModel = OCModel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        OCModel.testaaaaaaa()
        
//        ocModel.classForCoder.testaaaaaaa()
        
        ocModel.testBbbbbbb()
        
        // 实现
        model.callBackSuccess = ({
        
            print("123123132313131231231231232")
            
        })
        // 调用
        model.callBackSuccess()
        
        
        
        
        
        
        
        model.block = ({(s1:String) ->Bool in
          
            print(s1)
            
            return true
        })
        
        model.block("1234")
        
        // Do any additional setup after loading the view.
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
