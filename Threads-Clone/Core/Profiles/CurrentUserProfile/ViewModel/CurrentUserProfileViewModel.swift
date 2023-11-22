//
//  ProfileViewModel.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 22.11.2023.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI

class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task { await loadImage()} }
    }
    @Published var profileImage: Image?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
    
    private func loadImage() async {
        guard let item = selectedItem else { return }
        
        print("AAA: \(item)")
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
        print("BBB: \(data)")
        print("CCC: \(uiImage)")


    }
}
