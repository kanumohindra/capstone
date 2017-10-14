//
//  SiteCell.swift
//  SureSafety
//
//  Created by Xcode User on 2017-10-14.
//  Copyright © 2017 Xcode User. All rights reserved.
//

import UIKit

class SiteCell: UITableViewCell {
    
    let departmentName = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        departmentName.textAlignment = NSTextAlignment.left
        departmentName.font = UIFont.boldSystemFont(ofSize: 14)
        departmentName.backgroundColor = UIColor.clear
        departmentName.textColor = UIColor.black
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(departmentName)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        departmentName.frame = CGRect(x: 0, y: 5, width: 300, height: 30)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
