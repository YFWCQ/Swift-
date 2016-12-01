//
//  YFStructViewController.swift
//  SwiftWorks
//
//  Created by FYWCQ on 16/10/17.
//  Copyright © 2016年 Medalands. All rights reserved.
//

import UIKit

struct tableDataYF {
    var tableView:UITableView!
    var abc = [NSObject]()
    
}

class YFStructViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let ttBB:YFTBDataModel = YFTBDataModel()
        let a = NSObject()

        ttBB.dataArray.append(a)
        ttBB.dataArray.append(a)
        ttBB.dataArray.append(a)
        ttBB.dataArray.append(a)

        
        let ttAA:YFTBDataModel = ttBB;

//        var bb = ttBB.abc;
        
        ttAA.dataArray.removeAll()
        
        print("个数 : \(ttBB.dataArray.count)")
        print("个数 : \(ttAA.dataArray.count)")

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
