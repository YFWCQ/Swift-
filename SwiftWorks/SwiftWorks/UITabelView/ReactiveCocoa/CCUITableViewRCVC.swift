//
//  CCUITableViewRCVC.swift
//  SwiftWorks
//
//  Created by FYWCQ on 2017/5/15.
//  Copyright © 2017年 Medalands. All rights reserved.
//

import UIKit

import Result

import ReactiveSwift

class CCUITableViewRCVC: YFBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tableView:UITableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain)
        
        setTBDelegateOfSections(toObject: self, tableView: tableView, currentVC: self)
        
        self.view.addSubview(tableView)
        
        
        var dataArray:[NSObject] = [NSObject]()
        
        dataArray.append(YFReaCocoaCModel(dic: [String : AnyObject]()))
        dataArray.append(YFReaCocoaCModel(dic: [String : AnyObject]()))
    
        
        
        let sectionModel:YFTBSectionModel = YFTBSectionModel()
        sectionModel.dataArray = dataArray
        
        self.dataModelYF.dataArray.append(sectionModel)
        self.dataModelYF.dataArray.append(sectionModel)
        self.dataModelYF.dataArray.append(sectionModel)
        self.dataModelYF.dataArray.append(sectionModel)
        self.dataModelYF.dataArray.append(sectionModel)
        self.dataModelYF.dataArray.append(sectionModel)
        self.dataModelYF.dataArray.append(sectionModel)
        self.dataModelYF.dataArray.append(sectionModel)
        self.dataModelYF.dataArray.append(sectionModel)
        self.dataModelYF.dataArray.append(sectionModel)
        self.dataModelYF.dataArray.append(sectionModel)
        self.dataModelYF.dataArray.append(sectionModel)
        self.dataModelYF.dataArray.append(sectionModel)
        
        print(self.dataModelYF.dataArray.count)
        
        

        
        tableView.reloadData()

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
