//
//  ViewController.swift
//  OpsigoNewsApi
//
//  Created by MUHAMMAD ALFARABY on 05/02/21.
//

import UIKit
import Alamofire
class ViewController: UITableViewController {
  
  var news = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fetchNews()
//    tableView.tableFooterView = UIView()
    
  }
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return news.count
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = news[indexPath.row]
    return cell
  }
  
  
  func fetchNews() {
    let request = AF.request("https://newsapi.org/v2/top-headlines?country=id&apiKey=67c81ce67e4d473c86a1df57efd95da2").validate()
    request.responseDecodable(of: NewsModel.self) { (response) in
      guard let result = response.value else { return }
      result.articles.forEach { (Articles) in
        self.news.append(Articles.title)
      }
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
      
    }
    
  }
  
}

