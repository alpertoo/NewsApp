//
//  WebService.swift
//  NewsAppProject
//
//  Created by Alper Koçer on 7.01.2023.
//

import Foundation

class Webservice {
    
    func getNews (url: URL, completion: @escaping ([News]?) -> ()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
              let newsArray = try? JSONDecoder().decode([News].self, from: data)
                if let newsArray = newsArray {
                    completion(newsArray)
                }
            }
        }.resume()
    }
}
