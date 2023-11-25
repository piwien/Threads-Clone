//
//  UserProfileView.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 16.11.2023.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                
                Button(action: {}, label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                })
                
                // user content list
                UserContentListView(user: user)
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
    }
}

#Preview {
    UserProfileView(user: DeveloperPreview.shared.user)
}
