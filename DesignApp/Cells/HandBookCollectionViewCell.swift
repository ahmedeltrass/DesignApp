//
//  HandBookCollectionViewCell.swift
//  DesignApp
//
//  Created by Ahmed Eltrass on 13/09/2022.
//

import UIKit

class HandBookCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var overlay: UIView!
    @IBOutlet weak var bunner: UIImageView!
    @IBOutlet weak var logo: CustomImageView!
    @IBOutlet weak var progressBar: UIVisualEffectView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var SubtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
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
        gredient.startPoint = CGPoint(x: 0, y: 0)
        gredient.endPoint = CGPoint(x: 1, y: 1)
        gredient.frame = overlay.frame
        gredient.cornerRadius = 30
        gredient.cornerCurve = .continuous
        overlay.layer.insertSublayer(gredient, at: 0)
        overlay.layer.cornerRadius = 30
        overlay.layer.cornerCurve = .continuous
    }
    override public func prepareForReuse() {
        super.prepareForReuse()
    }
}
