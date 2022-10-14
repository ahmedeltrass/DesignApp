//
//  NotificationsTableViewCell.swift
//  DesignApp
//
//  Created by Ahmed Eltrass on 04/10/2022.
//

import UIKit

class NotificationsTableViewCell: UITableViewCell {

    @IBOutlet weak var notificationImageView: UIImageView!
    @IBOutlet weak var massageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var SubtitleLabel: UILabel!
    
    
    
    let gredient = CAGradientLayer()
    override public func layoutSubviews() {
        super.layoutSubviews()
        super.layoutIfNeeded()
    }
    override public func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(named: "Shadow")!.cgColor
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowOpacity = 0.25
        layer.masksToBounds = false
        layer.cornerRadius = 30
        layer.cornerCurve =  .continuous

    }
    override public func prepareForReuse() {
        super.prepareForReuse()
    }
}
