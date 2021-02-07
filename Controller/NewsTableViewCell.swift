//
//  NewsTableViewCell.swift
//  OpsigoNewsApi
//
//  Created by MUHAMMAD ALFARABY on 06/02/21.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

  @IBOutlet weak var imageNews: UIImageView!
  @IBOutlet weak var newsTitle: UILabel!
  @IBOutlet weak var newsDescription: UILabel!
  
  
  override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
