//
//  Converter.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import Foundation

class Converter {
    
    static func toData(_ object: Any) -> Data {
        var jsonData: Data!
        if (object is String) {
            jsonData = (object as! String).data(using: .utf8)!
        } else {
            do {
                jsonData = try JSONSerialization.data(withJSONObject: object, options: [])
            } catch _ as NSError {
            } catch {
            }
        }
        return jsonData
    }
}
