//
//  ProductManager.swift
//  Test App
//
//  Created by Spencer Halverson  on 3/31/23.
//

import Foundation
import Combine

class ProductManager: ObservableObject {
    
    @Published var product: Product?
    private var task: AnyCancellable?
    
    func fetchProduct(id: String) {
        task = LTKApi.getProduct(id: id)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Get Product Error: \(error.localizedDescription)")
                case .finished:
                    print("Get Product Request completed successfully")
                }
            }, receiveValue: { productResult in
                self.product = productResult.product
            })
    }
}
