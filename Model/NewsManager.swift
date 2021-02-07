//
//  NewsManager.swift
//  OpsigoNewsApi
//
//  Created by MUHAMMAD ALFARABY on 07/02/21.
//

import Foundation
import Alamofire

protocol NewsManagerDelegate {
  func updateNews(news: NewsModel)
}
struct NewsManager {
  
    var delegate: NewsManagerDelegate?
    func fetchNews() {
    let apiKey = "67c81ce67e4d473c86a1df57efd95da2"
    let request =     AF.request("https://newsapi.org/v2/top-headlines?country=id&apiKey=\(apiKey)").validate(statusCode: 200...500)
      request.responseDecodable(of: NewsModel.self) { (response) in
      guard let result = response.value else { return }
      self.delegate?.updateNews(news: result)
    }
  }
}
