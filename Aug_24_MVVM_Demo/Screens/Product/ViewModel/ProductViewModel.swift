//
//  ProductViewModel.swift
//  Aug_24_MVVM_Demo
//
//  Created by Vishal Jagtap on 18/12/24.
//


import Foundation

//ViewModel only contains business Logic
final class ProductViewModel{
    
    var products : [Product] = []
    var eventHandler : ((_ event : Event) -> Void)?
    
    func fetchProducts(){
        self.eventHandler?(.loading)
        APIManager.shared.fetchProducts { [weak self] res in
            self?.eventHandler?(.stopLoading)
            switch res{
                case .success(let products):
                    self?.eventHandler?(.loaded)
                    self?.products = products
                case .failure(let error):
                    self?.eventHandler?(.error)
            }
        }
    }
}

extension ProductViewModel{
    enum Event{
        case loading
        case stopLoading
        case loaded
        case error
    }
}
