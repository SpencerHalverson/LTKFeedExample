//
//  SwiftUIView.swift
//  Test App
//
//  Created by Spencer Halverson  on 3/31/23.
//

import SwiftUI

struct FeedView: View {
    
    @StateObject var viewModel = FeedManager()
    @State var selection: String? = nil
    
    var body: some View {
        NavigationView(content: {
            ScrollView {
                ForEach(viewModel.feedItems) { item in
                    NavigationLink(destination: FeedItemDetailView(item: item), tag: item.hash, selection: $selection, label: {
                        FeedItemView(item: item)
                    })
                }
            }
            .navigationBarTitle("My Feed", displayMode: .inline)
        })
        .onAppear(perform: { viewModel.fetchFeed() })
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
