//
//  ListPopupCell.swift
//  Vendas
//
//  Created by itechnotion on 15/07/19.
//  Copyright © 2019 itechnotion. All rights reserved.
//

import UIKit

class ListPopupCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
