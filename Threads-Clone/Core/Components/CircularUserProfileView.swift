//
//  CircularUserProfileView.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 17.11.2023.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall: return 28
        case .xSmall: return 32
        case .small: return 40
        case.medium: return 48
        case .large: return 64
        case .xLarge: return 80
        }
    }
}

struct CircularUserProfileView: View {
    var user: User?
    let size: ProfileImageSize
    
//    init(user: User?, size: ProfileImageSize) {
//        self.user = user
//        self.size = size
//    }
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundStyle(Color(.systemGray4))
        }
    }
}

#Preview {
    CircularUserProfileView(user: DeveloperPreview.shared.user, size: .medium)
}
