//
//  YFBaseCell.swift
//  SwiftWorks
//
//  Created by FYWCQ on 16/11/7.
//  Copyright © 2016年 Medalands. All rights reserved.
//

import UIKit

class YFBaseCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let view:UIView = UIView(frame: self.bounds)
        view.backgroundColor = RGBColor(r: 245, g: 246, b: 247)
        
        self.selectedBackgroundView = view
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func bindModel(model:AnyObject){
        
    }

}
