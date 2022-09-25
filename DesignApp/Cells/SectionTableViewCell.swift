//
//  SectionTableViewCell.swift
//  DesignApp
//
//  Created by Ahmed Eltrass on 23/09/2022.
//

import UIKit

class SectionTableViewCell: UITableViewCell {
  
    @IBOutlet var courseLogo: UIImageView!
    @IBOutlet weak var courseTitle: UILabel!
    @IBOutlet weak var courseSubtitle: UILabel!
    @IBOutlet weak var courseDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }


}
