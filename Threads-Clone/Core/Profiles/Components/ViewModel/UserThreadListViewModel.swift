//
//  UserThreadListViewModel.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 25.11.2023.
//

import Foundation

@MainActor
class UserThreadListViewModel: ObservableObject {
    @Published var threads = [Thread]()
    let user: User
    
    init(user: User) {
        self.user = user
        Task { try await fetchUserThreads() }
    }
    
    func fetchUserThreads() async throws {
        var threads = try await ThreadService.fetchUserThreads(uid: user.id)
        
        for i in 0 ..< threads.count {
            threads[i].user = self.user
        }
        
        self.threads = threads
    }
}
