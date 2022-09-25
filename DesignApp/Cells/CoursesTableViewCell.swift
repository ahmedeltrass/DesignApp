//
//  CoursesTableViewCell.swift
//  DesignApp
//
//  Created by Ahmed Eltrass on 14/09/2022.
//

import UIKit

class CoursesTableViewCell: UITableViewCell {

    @IBOutlet var courseBackground: UIImageView!
    @IBOutlet var courseBunner: UIImageView!
    @IBOutlet var courseLogo: UIImageView!
 
   
    @IBOutlet weak var courseTitle: UILabel!
    @IBOutlet weak var courseSubtitle: UILabel!
    
    
    @IBOutlet weak var courseDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(named: "Shadow")!.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 30
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.masksToBounds = false 
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
