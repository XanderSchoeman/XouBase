//
//  ProfileModel.swift
//  App
//
//  Created by Xander Schoeman on 2020/04/06.
//

import FluentSQLite
import Foundation
import Vapor

struct User: Content, SQLiteUUIDModel, Migration {
    var id: UUID?
    var username: String
    var password: String
        var profileImage: String?
        var fullName: String
        var email: String
        var gender: String
        var age: Int
        var favouriteCount: Int
        var genrePref: String
}


