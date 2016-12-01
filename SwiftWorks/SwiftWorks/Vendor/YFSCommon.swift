//
//  YFSCommon.swift
//  SwiftWorks
//
//  Created by FYWCQ on 16/11/7.
//  Copyright © 2016年 Medalands. All rights reserved.
//

import UIKit

let titleArray = ["模块A","模块B","模块C","模块D","模块E"]

let orderStateArray = ["待加工","已加工","已发货","交易完成","订单取消"]
let keyGuidePageKey = "keyGuidePageKey"


class FYCommon: NSObject {
    
    class func showAlertView(callbackBlock:@escaping FYAlertViewCallBackBlock,message:String,cancelButtonName:String,otherButtonTitle:String){
        
        YFAppservice.dddAlertbackBlock(callbackBlock, title:  "温馨提示", message: message, cancelButtonName: cancelButtonName, otherButtonTitles: otherButtonTitle)
    }
    class func showCusAlertView(callbackBlock:@escaping FYAlertViewCallBackBlock,title:String,message:String,cancelButtonName:String,otherButtonTitle:String?){
        
        YFAppservice.dddAlertbackBlock(callbackBlock, title:  title, message: message, cancelButtonName: cancelButtonName, otherButtonTitles: otherButtonTitle)
    }
    
    
    class func showAlertView(message:String){
        let alet:UIAlertView = UIAlertView.init(title: "温馨提示", message: message, delegate: nil, cancelButtonTitle: "确定")
        alet.show()
    }
    
//    class func gotoShopCar(){
//        
//        let  tab:UITableViewController = UIApplication.sharedApplication().delegate?.window!!.rootViewController as! UITableViewController
//        
//        tab.selectedIndex = 2
//    }
//    // 添加到购物车
//    class func addProModelToShopCar(model:FYShopCarModel){
//        
//        let  tab:FYTabBarViewController = UIApplication.sharedApplication().delegate?.window!!.rootViewController as! FYTabBarViewController
//        
//        let thirdNavi:FYNavigattionController = tab.viewControllers![2] as! FYNavigattionController
//        
//        let shopCarVC:FYShopCarViewController = thirdNavi.viewControllers[0] as! FYShopCarViewController
//        // view 已经加载过，请求过
//        if shopCarVC.isViewLoaded(){
//            shopCarVC.addProModel(model)
//        }
//        // 没有请求过直接 不进行操作
//    }
//    
//    // 立即购买
//    class func addModelToShopCarForPayNow(model:FYShopCarModel){
//        
//        let  tab:FYTabBarViewController = UIApplication.sharedApplication().delegate?.window!!.rootViewController as! FYTabBarViewController
//        
//        let thirdNavi:FYNavigattionController = tab.viewControllers![2] as! FYNavigattionController
//        
//        let shopCarVC:FYShopCarViewController = thirdNavi.viewControllers[0] as! FYShopCarViewController
//        
//        shopCarVC.addSelectedModelToPay(model)
//        
//        if tab.selectedIndex != 2{
//            tab.selectedIndex = 2
//        }else{
//            shopCarVC.navigationController?.popToViewController(shopCarVC, animated: true)
//            //            shopCarVC.navigationCzontroller?.popToViewController(shopCarVC, animated: true)
//        }
//    }
//    
    
    class func elementName(index:NSInteger)->String{
        
        if titleArray.count > index{
            return titleArray[index]
        }
        return ""
    }
    
    class func stateStr(index:NSInteger)->String{
        if orderStateArray.count > index{
            return orderStateArray[index]
        }
        return ""
    }
    
//    class func checkGuideView(viewC:UIViewController,tapSec:Selector){
//        
//        
//        if let _ = NSUserDefaults.standardUserDefaults().objectForKey(keyGuidePageKey){
//            
//            
//        }else{
//            NSUserDefaults.standardUserDefaults().setObject("1", forKey: keyGuidePageKey)
//            let imageView:UIImageView = UIImageView(frame: CGRectMake(0, 0, XFrom6_FY(375.0), XFrom6_FY(667.0)))
//            imageView.image = UIImage(named: "cusGuide")
//            imageView.userInteractionEnabled = true
//            let tapGes:UITapGestureRecognizer = UITapGestureRecognizer(target: viewC, action: tapSec)
//            imageView.addGestureRecognizer(tapGes)
//            
//            let  tab:FYTabBarViewController = UIApplication.sharedApplication().delegate?.window!!.rootViewController as! FYTabBarViewController
//            
//            tab.view.addSubview(imageView)
//            
//            
//        }
//        
//    }
    
}


func  IPhone4_5_6_6P(a:CGFloat,b:CGFloat,c:CGFloat,d:CGFloat) -> CGFloat{
    return (CGSize(width:320,height: 480).equalTo(UIScreen.main.bounds.size) ? (a) : (CGSize(width:320,height: 568).equalTo(UIScreen.main.bounds.size) ? (b) : (CGSize(width:375,height: 667).equalTo(UIScreen.main.bounds.size) ? (c) : (CGSize(width:414, height:736).equalTo(UIScreen.main.bounds.size) ? (d) : (a)))))
}

func XFrom6_FY(x:CGFloat) -> CGFloat{
    return (screenWidth) / 375.0 * x
}
func fontSize_FY(size:CGFloat) -> UIFont{
    return UIFont.systemFont(ofSize: size)
}

let iPhone_4_FY: Bool! =  CGSize(width:320,height: 480).equalTo(UIScreen.main.bounds.size) // iPhone4及4s
let iPhone_5_FY: Bool! =   CGSize(width:320,height: 566).equalTo(UIScreen.main.bounds.size)   // iPhone5及5s
let iPhone_6_FY: Bool! = CGSize(width:375, height:667).equalTo(UIScreen.main.bounds.size)// iPhone6//iPhone6+
let iPhone_6_plus_FY: Bool! = CGSize(width:750,height: 736).equalTo(UIScreen.main.bounds.size)//iPhone6+


//let titleColor_FY = UIColor(red: 80.0/255, green: 80.0/255, blue: 80.0/255, alpha:1)
//
//let subTitleColor_FY = UIColor(red: 113.0/255, green: 113.0/255, blue: 113.0/255, alpha:1)

let titleColor_FY = UIColor(red: 38.0/255, green: 38.0/255, blue: 38.0/255, alpha:1)

let subTitleColor_FY = UIColor(red: 80.0/255, green: 80.0/255, blue: 80.0/255, alpha:1)

let subSubTitleColor_FY = UIColor(red: 135.0/255, green: 135.0/255, blue: 135.0/255, alpha:1)


let mainColor_FY = UIColor(red: 139.0/255, green: 106.0/255, blue: 164.0/255, alpha:1)

let mainPinkColor_FY = UIColor(red: 234.0/255, green: 136.0/255, blue: 179.0/255, alpha:1)

let imageOfMainColor_FY = createImageWithColor( color: RGBColorA(r: 160.0, g: 120.0, b: 185.0, a:0.96))

let fontSizeTitle_FY = fontSize_FY(size: 15.0)

//let fontSizeTitle_FY

let fontSizeSubTitle_FY = fontSize_FY(size: 13.0)

let fontSizeSubSubTitle_FY = fontSize_FY(size: 12.0)


func mainGrayColor_FY()->UIColor{
    return UIColor(red: 235.0/255, green: 236.0/255, blue: 237.0/255, alpha:1)
}

func stringZerolength_FY(str:String?)->Bool{
    if str?.isEmpty == true || str == nil{
        
        return true
    }
    return false
}


