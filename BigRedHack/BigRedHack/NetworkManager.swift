//
//  NetworkManager.swift
//  BigRedHack
//
//  Created by myl142857 on 9/22/19.
//  Copyright © 2019 myl142857. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    private static let url = "http://35.232.171.57/"
    static func doWork(fileURL: String, completion: @escaping ([Data]) -> Void) {
        print("dowork")
        let parameters: [String: Any] = [
            "filename": fileURL
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                print("success!")
                let jsonDecoder = JSONDecoder()
                if let response = try? jsonDecoder.decode(Response.self, from: data) {
                    let data = response.data
                    completion(data)
                }
            
            case .failure(let error):
                print("dame")
                print(error.localizedDescription)
            }
        }
    }
}
