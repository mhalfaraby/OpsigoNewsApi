//
//  ViewController.swift
//  OpsigoNewsApi
//
//  Created by MUHAMMAD ALFARABY on 05/02/21.
//

import UIKit
import Alamofire
import AlamofireImage

class NewsTableViewController: UITableViewController {
  
  var news = [Articles]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.hidesBarsOnSwipe = true

    tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    tableView.estimatedRowHeight = 100
    tableView.rowHeight = UITableView.automaticDimension
    fetchNews()
    //    tableView.tableFooterView = UIView()
    
  }
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return news.count
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? NewsTableViewCell {
      
      let newNews = news [indexPath.row]
      cell.newsTitle.text = newNews.title
      cell.newsDescription.text = newNews.description
      let url = NSURL.init(string: newNews.urlToImage!)
      cell.imageNews.af.setImage(withURL: url! as URL)
      
      
      return cell
    } else {
      return UITableViewCell()
    }
    
  }
  
  
  func fetchNews() {
    let request = AF.request("https://newsapi.org/v2/top-headlines?country=id&apiKey=67c81ce67e4d473c86a1df57efd95da2").validate(statusCode: 200...500)
    
    request.responseDecodable(of: NewsModel.self) { (response) in
      guard let result = response.value else { return }
      self.news = result.articles
      //
      DispatchQueue.main.async {
        self.tableView.reloadData()
        
      }
      
    }
    
  }
  
}

