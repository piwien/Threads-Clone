//
//  UserCellView.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 17.11.2023.
//

import SwiftUI

struct UserCellView: View {
    let user: User
    
    var body: some View {
        HStack {
            CircularUserProfileView(user: user, size: .small)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.username)
                    .fontWeight(.semibold)
                Text(user.fullname)
            }
            .font(.footnote)
            
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray4),lineWidth: 1)
                }
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCellView(user: DeveloperPreview.shared.user)
}
