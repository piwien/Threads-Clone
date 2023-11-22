//
//  PreviewProvider.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 22.11.2023.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Sebastian Vettel", email: "sebastian@gmail.com", username: "sebastianvettel")
}
