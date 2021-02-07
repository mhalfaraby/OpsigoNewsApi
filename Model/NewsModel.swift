//
//  NewsModel.swift
//  OpsigoNewsApi
//
//  Created by MUHAMMAD ALFARABY on 05/02/21.
//

import Foundation

struct NewsModel: Codable {
  let status: String
  let articles: [Articles]
}
struct Articles: Codable {
  let source: Source
  let urlToImage: String?
  let title: String?
  let url: String?
  let description: String?
  let publishedAt: String
  let author: String?
}

struct Source: Codable{
  let name: String
}
