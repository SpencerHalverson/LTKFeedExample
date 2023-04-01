//
//  FeedItemView.swift
//  Test App
//
//  Created by Spencer Halverson  on 3/31/23.
//

import SwiftUI

struct FeedItemView: View {
    let item: FeedItem
    
    var body: some View {
        VStack(alignment: .leading) {
            ProfileBar(profileId: item.profileID)
                .frame(height: 55)
            
            HeroImageView(item: item)
            
            VStack(alignment: .leading) {
                Text(item.caption)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.primary)
                    .padding(12)

                Text(item.datePublished)
                    .font(.caption2)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.secondary)
                    .padding([.leading, .trailing, .bottom], 12)
            }
            
            Spacer(minLength: 25)
        }
        .frame(maxWidth: .infinity)
    }
}

extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.size.width
}


//struct FeedItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedItemView(item)
//    }
//}
