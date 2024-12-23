//
//  ViewController.swift
//  Aug_24_MVVM_Demo
//
//  Created by Vishal Jagtap on 18/12/24.
//

import UIKit

class ProductViewController: UIViewController {
    private var viewModel = ProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        observeEvent()
    }
    
    func initViewModel(){
        viewModel.fetchProducts()
    }
    
    func observeEvent(){
        viewModel.eventHandler = { event in
            switch event {
                case .loading:
                    print("Product Loading")
                case .loaded:
                    print("Data Loaded")
                    DispatchQueue.main.async{
                    
                    }
                case .error:
                    print("error")
                case .stopLoading:
                    print("Stop Loading")
            
            }
        }
    }
}
