//
//  HeroImageView.swift
//  Test App
//
//  Created by Spencer Halverson  on 3/31/23.
//

import SwiftUI

struct HeroImageView: View {
    
    let item: FeedItem
    @State private var isPresentingActivitySheet = false
    
    var body: some View {
        ZStack {
            
            AsyncImage(url: URL(string: item.heroImage)) { image in
                image
                    .resizable()
            } placeholder: {
                HStack {
                    Spacer()
                    ProgressView()
                        .foregroundColor(.primary)
                    Spacer()
                }
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: UIScreen.screenWidth, height: calculateImageHeight(screenWidth: UIScreen.screenWidth))
            
            VStack() {
                Spacer()
                
                HStack() {
                    Spacer()
                    
                    Button(action: {
                        self.isPresentingActivitySheet.toggle()
                    }, label: {
                        Color.white
                            .clipShape(Circle())
                            .overlay(Image(systemName: "arrow.up"))
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                    })
                    .padding()
                    .sheet(isPresented: $isPresentingActivitySheet, content: {
                        ActivitySheetView(items: [item.shareURL])
                    })
                }
            }
        }
    }
    
    func calculateImageHeight(screenWidth: CGFloat) -> CGFloat {
        return (CGFloat(item.heroImageHeight) / CGFloat(item.heroImageWidth)) * screenWidth
    }
}
