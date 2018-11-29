//
//  YFBaseListTitleVC.swift
//  SwiftWorks
//
//  Created by FYWCQ on 2018/9/29.
//  Copyright © 2018年 Medalands. All rights reserved.
//

import UIKit

let YFBaseListTitleCellIdentifier = "YFBaseListTitleCellIdentifier"

struct ListVCStruct {
    var vc:UIViewController?
    var title:String?
}

class YFBaseListTitleVC: YFBaseViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView?
    var listData = [ListVCStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func initView() -> Void {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight), style: UITableViewStyle.plain)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: YFBaseListTitleCellIdentifier)
        if let rCell = cell {
            return rCell
        }
        cell  = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: YFBaseListTitleCellIdentifier)
        
        return cell!;
    }

}
