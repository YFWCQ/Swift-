//
//  FYArrayViewController.swift
//  SwiftWorks
//
//  Created by FYWCQ on 15/12/24.
//  Copyright © 2015年 Medalands. All rights reserved.
//

import UIKit

class FYArrayViewController: YFBaseViewController {

    var abc = [NSObject]()
    
    var def = [NSObject]()
    
    var hhhh = [AnyObject]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let a = NSObject()
      
        abc.append(a)
        def.append(a)
        
        let b = FYArrayTestModel()
        
        abc.append(b)
        def.append(b)
        
        abc += def
        
        print("个数 : \(abc.count)")

        
        // 元组
//        var aoooo = ("a", ["a", "a"])

        let ges:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FYArrayViewController.aaaa(_:)))
    
        ges.addTarget(self, action: #selector(FYArrayViewController.bbbb(_:)))
        
        self.view.addGestureRecognizer(ges)
        
        
        let bModel = FYArrayTestModel()
        let aModel = bModel
        print(aModel.tt)

        aModel.tt.removeAll()
        print(aModel.tt)
        print(bModel.tt)
        
//        let tt:Array = ["123","123","123"]
        
//        var bb = tt
//        
//        bb.removeAll()
        
//        print(tt)
        
        // Model 指针传递
//        let model:FYArrayTestModel = FYArrayTestModel()
//        model.changeStr = "123"
//        
//        let model2:FYArrayTestModel = model
//        model2.changeStr = "4444"
//        
//        print(model.changeStr)
//        print(model2.changeStr)
        
        
        var aTTTT = ["2":"3"];
        
        let bTTTT = aTTTT
        
        aTTTT["vvvvv"] = "00000"

        
        
        print(aTTTT)
        print(bTTTT)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func aaaa(_ dd:UITapGestureRecognizer){
        print("aaaa")
        print("个数 : \(abc.count)")

    }
    @objc  func bbbb(_ dd:UITapGestureRecognizer){
        print("bbbb")
        print("个数 : \(abc.count)")

    }
    
    
    
    
    
}
