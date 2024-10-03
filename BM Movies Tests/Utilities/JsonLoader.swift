//
//  JsonLoader.swift
//  BM Movies
//
//  Created by Salah Khaled on 03/10/2024.
//

import Foundation

enum JsonLoaderFile: String {
    
    case get_movie_detail = "get_movie_detail"
    case get_movie_list = "get_movie_list"
}

class JsonLoader<T: Decodable> {

    func get(_ file: JsonLoaderFile) -> T? {
        
        let bundle = Bundle(for: type(of: self))
        if let url = bundle.url(forResource: file.rawValue, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                return jsonData
            } catch {
                return nil
            }
        }
        return nil
    }
}
