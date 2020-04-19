//
//  ProfileModel.swift
//  App
//
//  Created by Xander Schoeman on 2020/04/06.
//

import FluentSQLite
import Foundation
import Vapor

public struct ProfileData: Content, SQLiteModel, Migration {
    public var id: Int?
    var username: String
    var password: String
    var profileImage: String?
    
    init(id: Int, username: String, password: String, profileImage: String) {
        self.id = id
        self.username = username
        self.password = password
        self.profileImage = profileImage
    }
}

public struct ProfileResponse: Content {
    let request: ProfileData
}

