//
//  SettingView.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 26.11.2023.
//

import SwiftUI

struct SettingItem: Identifiable {
    var id = UUID()
    var icon: String
    var title: String
}

struct SettingView: View {
    
    @Environment(\.dismiss) var dismiss
    let settingsItems = [
        SettingItem(icon: "person.badge.plus", title: "Follow and invite friends"),
        SettingItem(icon: "bell", title: "Notifications"),
        SettingItem(icon: "heart", title: "Your likes"),
        SettingItem(icon: "lock", title: "Privacy"),
        SettingItem(icon: "person.crop.circle", title: "Account"),
        SettingItem(icon: "questionmark.circle", title: "Help"),
        SettingItem(icon: "info.circle", title: "About")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(settingsItems) { item in
                Button(action: {}, label: {
                    HStack(spacing: 10) {
                        Image(systemName: item.icon)
                            .foregroundColor(.black) // Renk özelleştirmesi
                            .imageScale(.medium) // İkon boyutu
                        Text(item.title)
                            .foregroundStyle(.black)
                        Spacer()
                    }
                    .padding(.vertical, 5)
                })
            }
            Divider()
            Button(action: {}, label: {
                Text("Switch Profiles")
            })
            Button(action: { AuthService.shared.signOut() }, label: {
                Text("Log out")
                    .foregroundStyle(.red)
            })
            Spacer()
        }
        .padding()
        .navigationTitle("Settings")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            dismiss()
        }, label: {
            HStack {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black) // Geri buton rengi
                    .imageScale(.medium)
                Text("Back")
                    .foregroundStyle(.black)
            }

        }))
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
