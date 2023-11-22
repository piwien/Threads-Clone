//
//  ExploreViewModel.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 22.11.2023.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task {
            try await fetchUsers()
        }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
