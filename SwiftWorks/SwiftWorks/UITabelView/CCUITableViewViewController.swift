//
//  CCUITableViewViewController.swift
//  SwiftWorks
//
//  Created by Medalands on 15/4/28.
//  Copyright (c) 2015年 Medalands. All rights reserved.
//

import UIKit

class CCUITableViewViewController: YFBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tableView:UITableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain)
        
        setTBDelegateOfSections(toObject: self, tableView: tableView, currentVC: self)
        
        self.view.addSubview(tableView)
        
        
        var dataArray:[NSObject] = [NSObject]()
        
        dataArray.append(YFTestCellModel(dic: [String : AnyObject]()))
        dataArray.append(YFTestCellModel(dic: [String : AnyObject]()))
//        dataArray.append(YFTestCellModel(dic: [String : AnyObject]()))
//        dataArray.append(YFTestCellModel(dic: [String : AnyObject]()))
//        dataArray.append(YFTestCellModel(dic: [String : AnyObject]()))
//        dataArray.append(YFTestCellModel(dic: [String : AnyObject]()))
//        dataArray.append(YFTestCellModel(dic: [String : AnyObject]()))
//        dataArray.append(YFTestCellModel(dic: [String : AnyObject]()))
//        dataArray.append(YFTestCellModel(dic: [String : AnyObject]()))
        
        
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
        
//        self.dataModelYF.dataArray.append(YFTestCellModel(dic: [String : AnyObject]()))
//        
//        self.dataModelYF.dataArray.append(YFTestCellModel(dic: [String : AnyObject]()))
//
//        self.dataModelYF.dataArray.append(YFTestCellModel(dic: [String : AnyObject]()))
//
//        self.dataModelYF.dataArray.append(YFTestCellModel(dic: [String : AnyObject]()))
//
//        self.dataModelYF.dataArray.append(YFTestCellModel(dic: [String : AnyObject]()))
//
//        self.dataModelYF.dataArray.append(YFTestCellModel(dic: [String : AnyObject]()))
//
//        self.dataModelYF.dataArray.append(YFTestCellModel(dic: [String : AnyObject]()))
//
//        self.dataModelYF.dataArray.append(YFTestCellModel(dic: [String : AnyObject]()))
//
//        self.dataModelYF.dataArray.append(YFTestCellModel(dic: [String : AnyObject]()))
//
//        self.dataModelYF.dataArray.append(YFTestCellModel(dic: [String : AnyObject]()))

        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:.default, reuseIdentifier:"myCell")
        
        cell.textLabel?.text = String(stringInterpolationSegment: (indexPath as NSIndexPath).row);
        
        return cell;
    }
    
    
    //    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath:NSIndexPath!) -> UITableViewCell!{
    //
    //        let cell = UITableViewCell(style:.Default, reuseIdentifier:"myCell")
    //
    ////        cell.textLabel.text = "swift cell \(indexPath.row)"
    //
    //        return cell
    //
    //    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        
        //        var controller = secondViewController()
        //        controller.title = "Swift 的自我介绍"
        //        controller.view.backgroundColor = UIColor(red: 10/255.0, green: 100/255.0, blue: 200/255.0, alpha: 1.0)
        //        self.navigationController?.pushViewController(controller, animated: true)
    }

}
