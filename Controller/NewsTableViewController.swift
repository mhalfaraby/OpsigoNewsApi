//
//  ViewController.swift
//  OpsigoNewsApi
//
//  Created by MUHAMMAD ALFARABY on 05/02/21.
//

import UIKit
import Alamofire
import AlamofireImage
class NewsTableViewController: UITableViewController{
  
  
  //MARK: -  Properties
  var news: [Articles] = []
  var selectedItem: Articles?
  var newsManager = NewsManager()
  
  
  //MARK: -  viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    newsManager.delegate = self
    newsManager.fetchNews()
    tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
  }
  
  
  //MARK: -  Pull to refresh
  @IBAction func refresh(_ sender: UIRefreshControl) {
    newsManager.fetchNews()
    sender.endRefreshing()
  }
  
  
  //MARK: -  TableView data source and delegate
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return news.count
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? NewsTableViewCell {
      
      let newNews = news[indexPath.row]
      cell.newsTitle.text = newNews.title
      cell.newsDescription.text = newNews.description
      
      if let image = newNews.urlToImage {
        let urlToImage = NSURL.init(string: image)
        cell.imageNews.af.setImage(withURL: urlToImage! as URL )
        
      } else {
        cell.imageNews.image = UIImage(named: "nophoto")
      }
      
      return cell
    } else {
      return UITableViewCell()
    }
    
    
  }
  
  
  //MARK: -  segue to Detail
  override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    selectedItem = news[indexPath.row]
    
    performSegue(withIdentifier: "toDetail", sender: self)
    return indexPath
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if segue.identifier == "toDetail" {
      let deatailVC = segue.destination as! DetailsNewsViewController
      deatailVC.detailNews = selectedItem
    }
    
  }
  
  
}


//MARK: -  extension NewsManagerDelegate

extension NewsTableViewController: NewsManagerDelegate {
  func updateNews(news: NewsModel) {
    self.news = news.articles
    
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
  
  
}

