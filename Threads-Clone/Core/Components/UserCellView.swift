//
//  UserCellView.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 17.11.2023.
//

import SwiftUI

struct UserCellView: View {
    var body: some View {
        HStack {
            CircularUserProfileView()
            
            VStack(alignment: .leading) {
                Text("sebastianvettel")
                    .fontWeight(.semibold)
                Text("Sebastian Vettel")
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
    UserCellView()
}
