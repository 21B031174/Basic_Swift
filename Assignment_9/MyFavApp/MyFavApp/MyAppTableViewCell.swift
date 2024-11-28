//
//  MyAppTableViewCell.swift
//  MyFavApp
//
//  Created by Елшан Арсен on 15.11.2024.
//

import UIKit

class MyAppTableViewCell: UITableViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(with item: StructProtocol) {
        coverImageView.image = item.coverImage
        titleLabel.text = item.title
    }

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
