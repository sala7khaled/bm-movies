//
//  URLRequest+Extension.swift
//  BM Movies
//
//  Created by Salah Khaled on 02/10/2024.
//

import UIKit
import SystemConfiguration

extension URLRequest {
    
    init(service: ServiceProtocol, cachePolicy: CachePolicy, timeoutInterval: TimeInterval) {
        let urlComponents = URLComponents(service: service)
        self.init(url: urlComponents.url!, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
        httpMethod = service.method.rawValue
        
        addValue("application/json", forHTTPHeaderField: APIHeader.contentType)
        addValue("application/json", forHTTPHeaderField: APIHeader.accept)
        addValue("iOS", forHTTPHeaderField: APIHeader.platform)
        addValue("Bearer \(APIKeys.token)", forHTTPHeaderField: APIHeader.authorization)
        
        if let uuid = UIDevice.current.identifierForVendor {
            addValue(uuid.uuidString, forHTTPHeaderField: APIHeader.deviceId)
        }
        
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            addValue(version, forHTTPHeaderField: APIHeader.version)
        }
        
        if let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            addValue(build, forHTTPHeaderField: APIHeader.build)
        }
        
        service.headers?.forEach { key, value in
            addValue(value, forHTTPHeaderField: key)
        }
        
        guard let body = service.body else { return }
        guard let dic = (body as! Codable).asDictionary() else { return }
        httpBody = try? JSONSerialization.data(withJSONObject: dic)
    }
}
