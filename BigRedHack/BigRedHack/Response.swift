//
//  Response.swift
//  BigRedHack
//
//  Created by myl142857 on 9/22/19.
//  Copyright © 2019 myl142857. All rights reserved.
//

import Foundation

struct Data: Codable {
    var dataType: String
    var text: String
}

struct Response: Codable {
    var success: Bool
    var data: [Data]
}
