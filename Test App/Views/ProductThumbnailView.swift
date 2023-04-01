//
//  ProductThumbnailView.swift
//  Test App
//
//  Created by Spencer Halverson  on 3/31/23.
//

import SwiftUI

struct ProductThumbnailView: View {
    
    @StateObject private var viewModel = ProductManager()
    @State private var presentWebview = false
    let productId: String
    
    var body: some View {
        Color.secondary
            .aspectRatio(1, contentMode: .fill)
            .overlay(
                AsyncImage(url: URL(string: viewModel.product?.imageURL ?? "")) { image in
                    image.resizable()
                } placeholder: {
                    Color(uiColor: .white)
                }
                .scaledToFill()
            )
            .clipped()
            .cornerRadius(7)
            .onAppear(perform: { viewModel.fetchProduct(id: productId) })
            .onTapGesture(perform: { self.presentWebview.toggle() })
            .sheet(isPresented: $presentWebview, content: {
                if let productLink = viewModel.product?.hyperlink, let url = URL(string: productLink) {
                    SafariView(url: url)
                }
            })
    }
}

struct ProductThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductThumbnailView(productId: "")
    }
}
