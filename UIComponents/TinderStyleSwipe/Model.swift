//
//  Model.swift
//  UIComponents
//
//  Created by Ernesto Cisnero on 5/11/26.
//

import SwiftUI

struct UserList: Identifiable {
    
    let id: Int
    let username: String
    let photo: String
    
}

var users = [
    UserList(id: 0, username: "User 0", photo: "person"),
    UserList(id: 1, username: "User 1", photo: "person.2"),
    UserList(id: 2, username: "User 2", photo: "person.3")
]

