//
//  Audio.swift
//  BigRedHack
//
//  Created by myl142857 on 9/20/19.
//  Copyright © 2019 myl142857. All rights reserved.
//

import Foundation

class Audio {
    var audioName: String!
    var url: String!
    var summary: String!
    
    init(audioName: String, url: String, summary: String) {
        self.audioName = audioName
        self.url = url
        self.summary = summary
    }
}
