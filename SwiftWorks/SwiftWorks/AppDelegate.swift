//
//  AppDelegate.swift
//  SwiftWorks
//
//  Created by Medalands on 15/4/23.
//  Copyright (c) 2015年 Medalands. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customiza tion after application launch.
        
         window = UIWindow(frame: UIScreen.main.bounds)
        
        let controller = CCUITableViewRCVC();
        
        self.window!.rootViewController = controller;
        
        self.window!.makeKeyAndVisible();
        
        
        
        
//        print(self.sw_convert("PAYPALISHIRING", 3))
//        print("--------------------------------------------------------------------------------")
//        print(self.convert("PAYPALISHIRING", 3))

//        print(self.convert("abc", 3))

//        print(self.convert("abcdefghigklmnopqrst", 3))
//        print("--------------------------------------------------------------------------------")
//        print(self.convert("abc", 3))
//        print("--------------------------------------------------------------------------------")
//        print(self.convert("abcdefghigkt", 3))
//        print("--------------------------------------------------------------------------------")
//        print(self.convert("abcdefghigklmnopqrstabcdefghigklmnopqrst", 5))
//        print("--------------------------------------------------------------------------------")
//        print(self.convert("abcdefghigklmnopqrstabcdefghigklmnopqrstabcdefghigklmnopqrstabcdefghigklmnopqrst", 5))
//        print("--------------------------------------------------------------------------------")
//        print(self.convert("abcde", 5))
//        print("--------------------------------------------------------------------------------")

        return true
    }
    
//    // leetcode 283. 移动零
//    func moveZeroes(_ nums: inout [Int]) {
//
//        //1.找到第一个为0 的下标d
//        //2.d往后 不为0 的下标，和 d 替换，d ++
//        var d = -1;
//        for i in 0 ..< nums.count {
//            let tempNum = nums[i]
//            if tempNum == 0 && d < 0 {
//                d = i
//            }
//            if tempNum != 0 && d >= 0 {
//                nums[d] = nums[i]
//                d = d + 1
//            }
//        }
//        if d < 0 {
//            return
//        }
//        for i in d ..< nums.count {
//            nums[i] = 0
//        }
//    }
    
    // leetcode 283. 移动零
    func moveZeroes(_ nums: inout [Int]) {
        
        //1.找到第一个为0 的下标d
        //2.d往后 不为0 的下标，和 d 替换，d ++
        var tempNums = [Int]()
        
        for i in 0 ..< nums.count {
            if nums[i] != 0 {
                tempNums.append(nums[i])
            }
        }
        
        for _ in tempNums.count ..< nums.count {
            tempNums.append(0)
        }
        
       nums = tempNums
    }

    

    func convert(_ s: String, _ numRows: Int) -> String {
        if s.count <= 1 {
            return s
        }
        if numRows == 1 {
            return s
        }
        let sectionNum = numRows * 2 - 2
        var section:Int
        if  s.count % sectionNum == 0 {
            section = s.count / sectionNum
        } else {
            section = s.count / sectionNum + 1
        }
        var tempString:String = ""
        let spaceFirstLastNum = (numRows - 2 ) * 2 + 1
        var spaceFirstLastString = ""
        for _ in 1 ... spaceFirstLastNum {
            spaceFirstLastString.append(" ")
        }
        
        var slitStartIndex = 0
        var slitEndIndex = 1
        
      

        for i in 0 ... section-1 {
            let startIndex = s.index(s.startIndex, offsetBy: slitStartIndex)
            let endIndex = s.index(s.startIndex, offsetBy: slitEndIndex)
            
            if s.count <= slitEndIndex {break}
            tempString.append(String(s[startIndex..<endIndex]))
            slitStartIndex = slitStartIndex + 1
            slitEndIndex = slitStartIndex + 1
        
            if i < section {
                tempString.append(spaceFirstLastString)
            }
        }
        if s.count <= section {
            return tempString
        }
        tempString.append("\n")
        
        let remainCount = s.count - section
        
        
        let middleSecctionLetterNum = section * 2;
        for i in 0 ... remainCount {
            if i >= s.count {// 超出 跳出循环
                break
            }
            let startIndex = s.index(s.startIndex, offsetBy: slitStartIndex)
            let endIndex = s.index(s.startIndex, offsetBy: slitEndIndex)

            let numLetter = i + 1
            let sectionMiddleSumNum = (numLetter % middleSecctionLetterNum == 0 ? numLetter / middleSecctionLetterNum : numLetter / middleSecctionLetterNum + 1)

            if sectionMiddleSumNum < numRows - 1 {
                if i % 2 == 0  {
                    // secion 第一个字母
                    tempString.append(String(s[startIndex..<endIndex]))
                    
                    var startSpaceStr = ""
                    let startSpaceIndex = (numRows - 2) * 2 + 1 - sectionMiddleSumNum * 2
                    for _ in 1 ... startSpaceIndex {
                        startSpaceStr.append(" ")
                    }
                    tempString.append(startSpaceStr)

                } else {
                    // secion 第二个字母
                    var lastSpaceStr = ""
                    for _ in 0 ... sectionMiddleSumNum * 2 - 2 {
                        lastSpaceStr.append(" ")
                    }
                    tempString.append(String(s[startIndex..<endIndex]))
                    tempString.append(lastSpaceStr)
                }
                
            } else {
                
                tempString.append(String(s[startIndex..<endIndex]))
                tempString.append(spaceFirstLastString)
            }

            slitStartIndex = slitStartIndex + 1
            slitEndIndex = slitStartIndex + 1
            
            if slitEndIndex > s.count {
                break
            }
        }
        
        
        
//        print(tempString)

//        for i in 1 ... numRows {
//            print(i)
//        }
        return tempString
    }
    
    
    func sw_convert(_ s: String, _ numRows: Int) -> String {
        if s.count <= 1  { return s }
        if numRows < 2 { return s }
        
        var zRows = [String](repeating: String(), count: min(s.count, numRows)) // 所有行
        var cursorRow = 0 // 光标的位置索引
        var nextLine = false // 是否换行
        
        for ch in s {
            zRows[cursorRow] += String(ch) // 光标位置字符
            if cursorRow == 0 || cursorRow == numRows - 1 { // 当为起始行时, 换行; 当为最后一行时, 不换行
                nextLine.toggle()
            }
            cursorRow += nextLine ? 1 : -1 // 移动光标
        }
        return zRows.joined()
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

