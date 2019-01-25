//
//  MAOListTableViewCell.swift
//  MyAppOneSwift
//
//  Created by Roman Guarino on 25/01/2019.
//  Copyright © 2019 Román Guarino. All rights reserved.
//

import UIKit

class MAOListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTrackName: UILabel!
    @IBOutlet weak var imgAlbum: UIImageView!
    @IBOutlet weak var lblAlbumName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    convenience init(item: MAOListViewControllerModel) {
        self.init()
    }
    
}
