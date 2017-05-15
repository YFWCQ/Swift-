//
//  FYLoveModel.swift
//  SwiftWorks
//
//  Created by Medalands on 15/7/27.
//  Copyright (c) 2015年 Medalands. All rights reserved.
//

import UIKit

class FYLoveModel: NSObject {
   
    var titleNew:String?
    var title:String?{
        
        get{
            print("哈哈Get")
            
            return titleNew
        }
        
        set(s){
            
            titleNew = s
            print(titleNew ?? "")
            
        }
    }
    
    func afb(){
        titleNew = "13"
    }
    
   override init()
    {
        super.init();
    }
    
}
