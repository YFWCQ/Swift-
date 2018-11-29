//
//  YFSConfig.swift
//  SwiftWorks
//
//  Created by FYWCQ on 16/11/7.
//  Copyright © 2016年 Medalands. All rights reserved.
//

import UIKit
import Foundation

let screenWidth: CGFloat = UIScreen.main.bounds.size.width
let screenHeight: CGFloat = UIScreen.main.bounds.size.height
let keyboardShowDuration = 0.25
let keyboardShowHeight: CGFloat = 256
let animationDuversion = (UIDevice.current.systemVersion as NSString).floatValue
let animationDuration: TimeInterval = 0.25

let LINE_HEIGHT: CGFloat = 0.5

let USER_LOGININ = "USER_LOGININ"
let USER_LOGINOUT = "USER_LOGINOUT"

let SHELF_STYLE = "HX_SHELF_STYLE"

let DEFAULT_PER_PAGE = "10"

//默认阅读
let DEFAULT_FONT: NSInteger = 19
let DEFAULT_BRIGHTNESS: Float = 1
let DEFAULT_HEIGHT: Float = 160
let DEFAULT_THEMEINDEX: NSInteger = 3
let DEFAULT_FONTMODEL: Bool = false

//书的image的默认比例（长宽）
let DEFAULT_BOOK_RATIO: CGFloat = 103/83

//默认等待图
let book_cover_placholder: UIImage = UIImage(named: "key_default_book")!
let icon_placeholder: UIImage = UIImage(named: "key_default_icon")!

enum Edit {
    case unEdit
    case edit
}

enum lineDirection {
    case left
    case right
    case bottom
    case top
}

protocol GYToVCDelegate: NSObjectProtocol {
    func toVC(vc: UIViewController)
}

let iPhone_4_4s: Bool! = CGSize(width:320,height: 480).equalTo(UIScreen.main.bounds.size)

let iPhone_5_5s: Bool! = CGSize(width:320,height: 568).equalTo(UIScreen.main.bounds.size)

let iPhone_6_6s: Bool! = CGSize(width:375,height: 667).equalTo(UIScreen.main.bounds.size)

let iPhone_678p: Bool! = CGSize(width:414,height: 736).equalTo(UIScreen.main.bounds.size)

let iPhoneX_XS: Bool! = CGSize(width:375,height: 812).equalTo(UIScreen.main.bounds.size)

let iPhoneXR_XSM: Bool! = CGSize(width:414,height: 896).equalTo(UIScreen.main.bounds.size)

let iPhoneXStyle: Bool! = (iPhoneX_XS || iPhoneXR_XSM)

let iPhoneExtraStatusHeight = iPhoneXStyle ? 24 : 0
let iPhoneExtraHeight = iPhoneXStyle ? 34 : 0

var ipad: Bool = UIDevice.current.userInterfaceIdiom == .pad

func  iPhone4_5_6_6P_XXS_XSMR(a:CGFloat,
                              b:CGFloat,
                              c:CGFloat,
                              d:CGFloat,
                              e:CGFloat,
                              f:CGFloat) -> CGFloat{
    return (iPhone_4_4s  ? (a) :
           (iPhone_5_5s  ? (b) :
           (iPhone_6_6s  ? (c) :
           (iPhone_678p  ? (d) :
           (iPhoneX_XS   ? (e) :
           (iPhoneXR_XSM ? (f) : (a)))))))
}

func XFrom6_FY(x:CGFloat) -> CGFloat{
    return (screenWidth) / 375.0 * x
}
func fontSize_FY(size:CGFloat) -> UIFont{
    return UIFont.systemFont(ofSize: size)
}


func dPrint(item:@autoclosure () -> Any) {
    #if DEBUG
    print(item())
    #endif
}

func decodeStringForKey(aDecoder: NSCoder,
                             key: String) -> String {
    let obj: AnyObject? = aDecoder.decodeObject(forKey: key) as AnyObject?
    if obj != nil {
        if obj is String || obj is NSString {
            return obj as! String
        } else {
            return ""
        }
    } else {
        return ""
    }
}

func decodeBoolForKey(aDecoder: NSCoder,
                           key: String) -> Bool {
    let obj: AnyObject? = aDecoder.decodeObject(forKey: key) as AnyObject?
    if obj != nil {
        if obj is Bool || obj is ObjCBool {
            return obj as! Bool
        } else {
            return false
        }
    } else {
        return false
    }
}

func decodeIntForKey(aDecoder: NSCoder,
                          key: String) -> Int {
    let obj: AnyObject? = aDecoder.decodeObject(forKey: key) as AnyObject?
    if obj != nil {
        return obj as! Int
    } else {
        return 0
    }
}

func loadNibName(name: String) -> AnyObject {
    
  let view: AnyObject = Bundle.main.loadNibNamed(name, owner: nil, options: nil) as AnyObject
    
    return view
}

func RGBColor(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
    return UIColor(red: r/255, green: g/255, blue: b/255, alpha:1)
}

func RGBColorA(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha:a)
}




func setLightGrayFontSizeLabel(label:UILabel){
    label.textColor = titleColor_FY
    label.font = fontSize_FY(size: 11.0)
}

//添加单击手势
func addTGR(target: AnyObject, action: Selector, view: UIView) {
    let tgr = UITapGestureRecognizer(target: target, action: action)
    view.addGestureRecognizer(tgr)
}

//添加pan
func addPan(target: AnyObject, action: Selector, view: UIView)  {
    let pan = UIPanGestureRecognizer(target: target, action: action)
    view.addGestureRecognizer(pan)
}

//添加双击手势
func addDoubleClickTGR(target: AnyObject, action: Selector, view: UIView) {
    let tgr = UITapGestureRecognizer(target: target, action: action)
    tgr.numberOfTapsRequired = 2
    view.addGestureRecognizer(tgr)
}

//添加常按手势
func addLongPress(target: AnyObject, action: Selector, view: UIView) {
    let tgr = UILongPressGestureRecognizer(target: target, action: action)
    tgr.minimumPressDuration = 0.5
    view.addGestureRecognizer(tgr)
}

//根据文字、字体、最大边长，获取自适应的rect
func getAutoRect(str: NSString?, font: UIFont, maxWidth: CGFloat, maxHeight: CGFloat) -> CGRect {
    var text = str
    if text == nil {
        text = NSString(string: "           ")
    }
    
    
    let size = CGSize(width: maxWidth, height: maxHeight)
    let actualRect: CGRect = text!.boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
    return actualRect
}

func getAutoRect(str: NSString?, font: UIFont, lineHeight: CGFloat, maxWidth: CGFloat, maxHeight: CGFloat) -> CGRect {
    var text = str
    if text == nil {
        text = NSString(string: "           ")
    }
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = lineHeight
    
    let size = CGSize(width:maxWidth, height:maxHeight)
    let actualRect: CGRect = text!.boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font, NSAttributedStringKey.paragraphStyle : paragraphStyle], context: nil)
    return actualRect
}

//给一个坐标 图片名 最大限度的fix图片 返回图片
func createImageView(name: String, frame: CGRect) -> UIImageView {
    let image = UIImage(named: name)!
    let imageWidth = image.size.width
    let imageHeight = image.size.height
    var frameWidth = frame.size.width
    var frameHeight = frame.size.height
    
    if imageWidth < frameWidth || imageHeight < frameHeight {
        var x = frame.origin.x
        var y = frame.origin.y
        let imageView = UIImageView()
        imageView.image = image
        
        if imageWidth > frameWidth {
            y += (frameHeight - imageHeight)/2
            frameHeight = frameWidth*imageHeight/frameHeight
        } else {
            x += (frameWidth - imageWidth)/2
            frameWidth = frameHeight*imageWidth/frameWidth
        }
        
        
        imageView.frame = CGRect(x: x, y: y, width: frameWidth, height: frameHeight)
        return imageView
    } else {
        let imageView = UIImageView(frame: frame)
        if frameWidth/frameHeight < imageWidth/imageHeight{
            let width = frameWidth*imageHeight/frameHeight
            let height = imageHeight
            let center_x = (width - frameWidth)/2
            
            
            
            let rect = CGRect(x: center_x, y: 0, width: width, height: height)
            imageView.image = UIImage(cgImage: image.cgImage!.cropping(to: rect)!)
        } else {
            let width = imageWidth
            let height = frameHeight*imageWidth/frameWidth
            let center_y = (height - frameHeight)/2
            
            
            let rect = CGRect(x: 0, y: center_y, width: width, height: height)
            imageView.image = UIImage(cgImage: image.cgImage!.cropping(to: rect)!)
        }
        return imageView
    }
}

//创建指定尺寸大小的image
func createTransformWidth(image: UIImage, size: CGSize) -> UIImage {
    UIGraphicsBeginImageContext(size)
    

    image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
    let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return scaledImage!
}

//color 转 image
func createImageWithColor(color: UIColor) -> UIImage {
    
    let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    context!.setFillColor(color.cgColor)
    context!.fill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
}

//创建带透明度的 image
func imageByApplyingAlpha(image: UIImage, alpha: CGFloat) -> UIImage {
    
    UIGraphicsBeginImageContextWithOptions(image.size, false, 0.0)
    
    let ctx = UIGraphicsGetCurrentContext()
    
    let area = CGRect(x: 0, y: 0, width: 1, height: 1)
    
    ctx!.scaleBy(x: 1, y: -1)
    ctx!.translateBy(x: 0, y: -area.size.height)
    ctx!.setBlendMode(CGBlendMode.multiply)
    
    ctx!.setAlpha(alpha)
    ctx?.draw(image.cgImage!, in: area)
    
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!;
}


func validateMobile(mobileNum:String) ->Bool{
    
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    let MOBILE = "^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$"
    
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    let CM = "^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$"
    
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    let CU = "^1(3[0-2]|5[256]|8[56])\\d{8}$"
    
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    let CT = "^1((33|53|8[09])[0-9]|349)\\d{7}$"
    
    let regextestmobile = NSPredicate(format:"SELF MATCHES %= ",MOBILE)
    let regextestcm = NSPredicate(format:"SELF MATCHES %= ",CM)
    let regextestcu = NSPredicate(format:"SELF MATCHES %= ",CU)
    let regextestct = NSPredicate(format:"SELF MATCHES %= ",CT)
    
    if  regextestmobile.evaluate(with: mobileNum) == true ||
        regextestcm.evaluate(with: mobileNum) == true ||
        regextestcu.evaluate(with: mobileNum) == true ||
        regextestct.evaluate(with: mobileNum) == true {
        return true
    } else{
        return false
        
    }
}

func after(time: Double, block: (() -> ())) {
    after(time: time) { 
        block()
    }
}

func checkNetStatus() -> Bool {

//    let r = Reachability(hostname: "www.hongxiu.com")
//    switch r?.currentReachabilityStatus(){
//    case .NotReachable:
//        return false
//    case .ReachableViaWiFi:
//        return true
//    case .ReachableViaWWAN:
//        return true
//    }
        return false
}

//MARK: 项目专用

func configCornerRadiusBtn(btn: UIButton, title: String, font: UIFont) {
    btn.layer.cornerRadius = 5
    btn.layer.masksToBounds = true
    btn.setTitle(title, for: UIControlState.normal)
    btn.setTitleColor(UIColor.white, for: UIControlState.normal)
    btn.titleLabel?.font = font
    btn.backgroundColor = UIColor.applicationMainColor()
}

func gLog<T>(obj: T) {
    #if DEBUG
        print(obj)
    #else
        
    #endif
}
