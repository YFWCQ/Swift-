//
//  YFForVC.swift
//  SwiftWorks
//
//  Created by FYWCQ on 16/12/1.
//  Copyright © 2016年 Medalands. All rights reserved.
//

import UIKit

class YFForVC: YFBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Swift 3.0 去掉了 C 语言风格的 For 循环
        goThroughAllOfConditionItemInArray()
        
    }
    
    func nomalForLoopYF() -> Void {
        // 利用循环 拼接 字符串
        var ss = ""
        for i in 0...10 {
            ss += "\(i)"
        }
        print("ss: " + ss)
    }
    
    func goThroughAllItemInArray() -> Void {
        
        let array = ["1","2","3","4","5"]
        //        let array33 = [1,2,3,5]
        var ss = ""
        
        for i in 0..<array.count{
            print(array[i])
        }
        
        for aa in array {
            ss += aa
        }
        print("ss: " + ss)
        
        var sb = ""
        // 如果想知道 索引 怎么办呢
        for bb in array.enumerated() {
            
            //       \ 后面加 () 小括号里 可以写代码（变量表达式）
            sb += "[\(bb.offset)]\(bb.element)"
            
        }
        print("sb: " + sb)
        
        // 还可以再改写一下
        var ssb = ""
        for (index, item) in array.enumerated() {
            ssb += "[\(index)]\(item)"
        }
        print("ssb: " + ssb)
    }
    
    // 逆序 遍历
    func goThroughAllOfReverseItemInArray() -> Void {
        
        let array = ["1","2","3","4","5"]
        //        let array33 = [1,2,3,5]
        
        var sb = ""
        
        for bb in array.enumerated().reversed() {
            
            //       \ 后面加 () 小括号里 可以写代码（变量表达式）
            sb += "[\(bb.offset)]\(bb.element)"
            
        }
        print("sb: " + sb)
    }
    
    // 条件 取数组元素
    func goThroughAllOfConditionItemInArray() -> Void {
        
        let array = ["1","2","3","4","5"]
        //        let array33 = [1,2,3,5]
        
        var sb = ""
        
        for bb in array.enumerated().filter({ (index, item)  in index % 2 == 0
            
        }) {
            
            //       \ 后面加 () 小括号里 可以写代码（变量表达式）
            sb += "[\(bb.offset)]\(bb.element)"
            
        }
        
        
        print("sb: " + sb)
    }
    
    
    
    
}
