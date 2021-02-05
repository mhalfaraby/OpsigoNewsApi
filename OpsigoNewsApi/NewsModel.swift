//
//  NewsModel.swift
//  OpsigoNewsApi
//
//  Created by MUHAMMAD ALFARABY on 05/02/21.
//

import Foundation

struct NewsModel: Decodable {
  let articles: [Articles]
}
struct Articles: Decodable {
  let title: String
}
