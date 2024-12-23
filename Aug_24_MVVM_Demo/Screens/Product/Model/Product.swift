//
//  Product.swift
//  Aug_24_MVVM_Demo
//
//  Created by Vishal Jagtap on 18/12/24.
//

struct Product : Codable{
    var id : Int
    var title : String
    var price : Double
    var description : String
    var category : String
    var image : String
    var rating : Rating
}

struct Rating : Codable{
    var rate : Double
    var count : Int
}
