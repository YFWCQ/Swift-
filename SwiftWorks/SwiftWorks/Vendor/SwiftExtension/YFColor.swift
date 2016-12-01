//
//  YFColor.swift
//  Jewelry
//
//  Created by FYWCQ on 16/11/7.
//  Copyright © 2016年 ___GY___. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    class func RGB(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha:1)
    }
    
    //MARK: ------------------------------ 框架需要颜色  ------------------------------
    
    class func applicationMainColor() -> UIColor {
        return RGB(r: 109, g: 76, b: 138)
    }
    
    //MARK: -- TabBar
    class func applicationTabBarSelColor() -> UIColor {
        return RGB(r: 253, g: 252, b: 0)
    }
    
    //MARK: --  common
    class func applicationVCBacColor() -> UIColor {
        return RGB(r: 248, g: 248, b: 248)
    }
    
    //MARK: -- TableView
    
    class func applicationTableViewBgColor() -> UIColor {
        return RGB(r: 239, g: 239, b: 239)
    }
    
    class func applicationTableViewSelectedColor() -> UIColor {
        return RGB(r: 240, g: 240, b: 240)
    }
    
    class func applicationLightGray_() -> UIColor {
        return RGB(r: 235, g: 235, b: 241)
    }
    
    //MARK:  ------
    
    //浅灰色线条
    class func applicationLightGrayLine() -> UIColor {
        return RGB(r: 217, g: 217, b: 217)
    }
    
    //红色
    class func applicationRedColor() -> UIColor {
        return RGB(r: 195, g: 17, b: 1)
    }
    
    class func applicationNavColor() -> UIColor {
        return RGB(r: 37, g: 42, b: 45)
    }
    
    // 非常浅的灰色
    class func applicationLightGray() -> UIColor {
        return RGB(r: 246, g: 246, b: 246)
    }
    
    class func applicationLineColor() -> UIColor {
        return RGB(r: 200, g: 200, b: 200)
    }
    
    // 一般用作 cell 之间的线条
    class func applicationDarkGray() -> UIColor {
        return RGB(r: 215, g: 215, b: 215)
    }
    
    //天蓝色
    class func applicationBlueColor() -> UIColor {
        return RGB(r: 1, g: 122, b: 255)
    }
    
    
    //深色遮罩层
    class func applicationDarkBlack() -> UIColor {
        return RGB(r: 76, g: 81, b: 85)
    }
    
    class func applicationTabBarTitle() -> UIColor {
        return RGB(r: 118, g: 118, b: 118)
    }
    
    //MARK: ------------------------------ 其他颜色 下边填写  ------------------------------
    
}
