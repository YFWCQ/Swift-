//
//  YFTBBaseDataSource.swift
//  SwiftWorks
//
//  Created by FYWCQ on 16/11/7.
//  Copyright © 2016年 Medalands. All rights reserved.
//

import UIKit

class YFTBBaseDataSource: NSObject,UITableViewDataSource {

    weak var currentVC:YFBaseViewController!
    
    var dataModel:YFTBDataModel!
    
    required init(daModel: YFTBDataModel,VC:YFBaseViewController) {
        super.init()
        dataModel = daModel
        currentVC = VC
    }
    
    //MARK:------Section个数
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //MARK:Row个数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style:.default, reuseIdentifier:"systemCell")
        
        return cell;
    }

    
}
