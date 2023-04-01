//
//  ProfileManager.swift
//  Test App
//
//  Created by Spencer Halverson  on 3/31/23.
//

import Foundation
import Combine

class ProfileManager: ObservableObject {
    
    @Published var profile: Profile?
    private var task: AnyCancellable?
    
    func fetchProfile(id: String) {
        task = LTKApi.getProfile(id: id)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Get Profile Error: \(error.localizedDescription)")
                case .finished:
                    print("Get Profile Request completed successfully")
                }
            }, receiveValue: { profileResult in
                self.profile = profileResult.profile
            })
    }
}
