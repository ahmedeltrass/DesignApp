//
//  TopicsTableViewCell.swift
//  DesignApp
//
//  Created by Ahmed Eltrass on 25/09/2022.
//

import UIKit

class TopicsTableViewCell: UITableViewCell {
    
      @IBOutlet var topicIcon: UIImageView!
      @IBOutlet weak var topicLabel: UILabel!
      
      
      override func awakeFromNib() {
          super.awakeFromNib()
          
      }

      override func setSelected(_ selected: Bool, animated: Bool) {
          super.setSelected(selected, animated: animated)

          
      }
}
