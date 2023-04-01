//
//  ProfileBar.swift
//  Test App
//
//  Created by Spencer Halverson  on 3/31/23.
//

import SwiftUI

struct ProfileBar: View {
    
    @StateObject var viewModel = ProfileManager()
    let profileId: String
    
    var body: some View {
        HStack(spacing: 8) {
            if let profile = viewModel.profile {
                AsyncImage(url: URL(string: profile.avatarURL)) { image in
                    image.resizable()
                } placeholder: {
                    Color(uiColor: .lightGray)
                }
                .clipShape(Circle())
                .frame(width: 30, height: 30)
                
                Text(profile.displayName)
                    .font(.headline)
                    .foregroundColor(.primary)
                    
            }
            
            Spacer()
        }
        .padding([.leading, .trailing], 15)
        .onAppear(perform: { viewModel.fetchProfile(id: profileId) })
    }
}

struct UserProfileBar_Previews: PreviewProvider {
    static var previews: some View {
        ProfileBar(profileId: "224c9545-eccd-11ec-843c-d95c5acdfd12")
    }
}
