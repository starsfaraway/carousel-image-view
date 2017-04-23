//
//  MRCollectionCell.swift
//  MRImageCarousel
//
//  Created by Matthew Riley on 4/22/17.
//  Copyright © 2017 Farawaystars. All rights reserved.
//

import UIKit

class MRCollectionCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8.0
        self.contentView.clipsToBounds = true
        self.imageView.clipsToBounds = true
    }

}
