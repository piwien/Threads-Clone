//
//  CurrentUserProfileView.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 22.11.2023.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile = false
    @State private var showSettings = false
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    
                    ProfileHeaderView(user: currentUser)
                    
                    Button(action: { showEditProfile.toggle() }, label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                            .frame(width: 352, height: 32)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            }
                    })
                    
                    //user content listview
                    if let user = currentUser {
                        UserContentListView(user: user)
                    }
                    
                }
            }
            .sheet(isPresented: $showEditProfile, content: {
                if let user = currentUser {
                    EditProfileView(user: user)
                }
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showSettings.toggle()
//                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }
                }
            }
            .padding(.horizontal)
            .navigationDestination(isPresented: $showSettings, destination: {
                SettingView()
            })

        }
    }
}

#Preview {
    CurrentUserProfileView()
}
