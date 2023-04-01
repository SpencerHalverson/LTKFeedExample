//
//  ActivitySheetView.swift
//  Test App
//
//  Created by Spencer Halverson  on 3/31/23.
//

import SwiftUI

struct ActivitySheetView: UIViewControllerRepresentable {
    
    let items: [Any]
    let activities: [UIActivity]? = nil
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        return UIActivityViewController(activityItems: items, applicationActivities: activities)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
}
