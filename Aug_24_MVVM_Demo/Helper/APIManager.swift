//
//  APIManager.swift
//  Aug_24_MVVM_Demo
//
//  Created by Vishal Jagtap on 18/12/24.
//

import UIKit

enum DataError : Error{
    case invalidURL
    case invalidResponse
    case invalidDecoding
    case network(Error?)
}

typealias Handler = ((Result<[Product], DataError>) -> Void)

final class APIManager{
    
    static let shared = APIManager()
    
    private init(){}

    func fetchProducts(completion: @escaping Handler){
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse,
                    200...299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return }
            
            do{
                let products = try? JSONDecoder().decode([Product].self, from: data!)
                completion(.success(products!))
            }catch{
                completion(.failure(.network(error)))
            }
        }.resume()
    }
}
