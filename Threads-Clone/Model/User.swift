//
//  User.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 22.11.2023.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
