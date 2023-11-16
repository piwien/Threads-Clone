//
//  CircularUserProfileView.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 17.11.2023.
//

import SwiftUI

struct CircularUserProfileView: View {
    var body: some View {
        Image("sebastian-vettel")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
        .clipShape(Circle())
    }
}

#Preview {
    CircularUserProfileView()
}
