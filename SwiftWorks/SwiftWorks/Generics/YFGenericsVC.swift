//
//  YFGenericsVC.swift
//  SwiftWorks
//
//  Created by FYWCQ on 16/12/7.
//  Copyright © 2016年 Medalands. All rights reserved.
//

import UIKit

class YFGenericsVC: YFBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var a = "4"
        var b = "5"
        print("a = " + "\(a)")
        print("b = " + "\(b)")
        
        swapTwoValues(a: &a, b: &b)
        
        print("a = " + "\(a)")
        print("b = " + "\(b)")
        
        
        var array:[String] = ["22","dd","dddd"]
        
        self.editArray(aaa: &array)
        
        print(array)
    }

   
    func swapTwoints(a:inout Int,b:inout Int)
    {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    func swapTwoValues<R>(a:inout R,b:inout R)
    {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    
     func  editArray(aaa:inout Array<String>)
    {
        aaa.removeAll()
    }
    
    
}
