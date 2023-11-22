//
//  UserService.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 22.11.2023.
//

import FirebaseFirestoreSwift
import Firebase

class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init() {
        Task {
            try await fetchCurrentUser()
        }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        
        print("User is: \(user)")
    }
    
    func reset() {
        self.currentUser = nil
    }
}
