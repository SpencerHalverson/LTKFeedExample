//
//  FeedManager.swift
//  Test App
//
//  Created by Spencer Halverson  on 3/31/23.
//

import Foundation
import Combine

class FeedManager: ObservableObject {
    
    @Published var feedItems: [FeedItem] = []
    private var tasks: [AnyCancellable] = []
    
    func fetchFeed() {
        LTKApi.getFeatured(featured: true, limit: 20)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Get Feed Error: \(error.localizedDescription)")
                case .finished:
                    print("Get Feed Request completed successfully")
                }
            }, receiveValue: { feedResult in
                self.feedItems = feedResult.feedItems.sorted(by: { $0.datePublished > $1.datePublished })
            })
            .store(in: &tasks)
    }
}
