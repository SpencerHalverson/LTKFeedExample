//
//  FeedItemDetailView.swift
//  Test App
//
//  Created by Spencer Halverson  on 3/31/23.
//

import SwiftUI

struct FeedItemDetailView: View {
    
    let item: FeedItem
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ProfileBar(profileId: item.profileID)
                    .frame(height: 55)
                
                HeroImageView(item: item)
                
                Group {
                    Text("Promoted Products")
                        .bold()
                        .padding(.top)
                    
                    if !item.productIDS.isEmpty {
                        let columns = [
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ]
                        LazyVGrid(columns: columns, alignment: .center, spacing: 12, content: {
                            ForEach(0..<item.productIDS.count, id: \.self) { index in
                                ProductThumbnailView(productId: item.productIDS[index])
                            }
                        })
                        .padding(.bottom)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct FeedItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FeedItemDetailView(item: FeedItem(heroImage: "https://product-images-cdn.liketoknow.it/H1Ul77AEcaQLETzRK6gRVGFYfoS4vrOk6s9hItnO4S9ml7xJ9iJVAvBMNdK37RzNFgpUYif9_eYHj_JqU6EpsoH7L0GolICLVTpvOaeZXVFMgWDkYckUBilAtuwHOLSjR8rhMzOaM129dJYhDFFUVK3RUOGL9FOv2YyruidFig_W6SjlXKetytGaNE0-", heroImageWidth: 1536, heroImageHeight: 1536, id: "", profileID: "091283d4-ed22-11ec-8a16-ad65ec98f55b", profileUserID: "", videoMediaID: "", status: "", caption: "#LTKworkwear #LTKSeasonal #LTKstyletip", shareURL: "https://liketk.it/45Bll", dateCreated: "", dateUpdated: "", dateScheduled: "", datePublished: "2023-03-29T01:34:51+00:00", productIDS: [
            "e817356c-cdd1-11ed-bb13-0242ac110003",
            "e824d2da-cdd1-11ed-bb13-0242ac110003",
            "e827dfa6-cdd1-11ed-bb13-0242ac110003",
            "e82b606f-cdd1-11ed-bb13-0242ac110003",
            "e82e40ea-cdd1-11ed-bb13-0242ac110003",
            "e831bdd1-cdd1-11ed-bb13-0242ac110003",
            "e83553c3-cdd1-11ed-bb13-0242ac110003",
            "e8393093-cdd1-11ed-bb13-0242ac110003",
            "e83bcf91-cdd1-11ed-bb13-0242ac110003",
            "e83e11b2-cdd1-11ed-bb13-0242ac110003",
            "e841adc2-cdd1-11ed-bb13-0242ac110003",
            "e8459ada-cdd1-11ed-bb13-0242ac110003"
        ], hash: "70XNwrAjsCtGMsN9FKRcsR"))
    }
}
