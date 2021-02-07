//
//  DetailsNewsViewController.swift
//  OpsigoNewsApi
//
//  Created by MUHAMMAD ALFARABY on 06/02/21.
//

import UIKit
import AlamofireImage
class DetailsNewsViewController: UIViewController {
  
  //MARK: -  Properties
  
  var detailNews: Articles?
  
  @IBOutlet weak var detailImage: UIImageView!
  @IBOutlet weak var detailTitle: UILabel!
  @IBOutlet weak var detailDescription: UILabel!
  @IBOutlet weak var link: UILabel!
  @IBOutlet weak var time: UILabel!
  @IBOutlet weak var authorName: UILabel!
  @IBOutlet weak var links: UITextView!
  
  //MARK: -  viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    
    links.isEditable = false
    links.dataDetectorTypes = UIDataDetectorTypes.all
    
    detailTitle.text = detailNews?.title
    detailDescription.text = detailNews?.description
    time.text = detailNews?.publishedAt
    authorName.text = detailNews?.source.name
    links.text = detailNews?.url
    
    if let image = detailNews?.urlToImage {
      let urlToImage = NSURL.init(string: image)
      detailImage.af.setImage(withURL: urlToImage! as URL )
    }
    else {
      detailImage.image = UIImage(named: "nophoto")
    }
  }
}
