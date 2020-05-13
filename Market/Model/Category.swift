//
//  Category.swift
//  Market
//
//  Created by Ilyasa' Azmi on 13/05/20.
//  Copyright © 2020 Ilyasa' Azmi. All rights reserved.
//

import Foundation
import UIKit

class Category {
    var id: String
    var name: String
    var image: UIImage?
    var imageName: String?
    
    init(_name: String, _imageName: String) {
        id = ""
        name = _name
        imageName = _imageName
        image = UIImage(named: _imageName)
    }
    
    init(_dictionary: NSDictionary) {
        id = _dictionary[kOBJECTID] as! String
        name = _dictionary[kNAME] as! String
        image =  UIImage(named: _dictionary[kIMAGENAME] as? String ?? "")
    }
}

//MARK: Retrive category from firebase

func downloadCategoryFromFirebase(completion: @escaping (_  categoryArray: [Category]) -> Void) {
    
    var categoryArray: [Category] = []
    
    FirebaseReference(.Category).getDocuments { (snapshot, error) in
        
        guard let snapshot = snapshot else {
            completion(categoryArray)
            return
        }
        
        if !snapshot.isEmpty {
            for categoryDict in snapshot.documents {
                categoryArray.append(Category(_dictionary: categoryDict.data() as NSDictionary))
            }
        }
        
        completion(categoryArray)
    }
}

//MARK: Save category function

func saveCategoryToFirebase(_ category: Category) {
    let id = UUID().uuidString
    category.id = id
    
    FirebaseReference(.Category).document(id).setData(categoryDictionaryFrom(category) as! [String : Any])
}

//MARK: Helpers

func categoryDictionaryFrom(_ category: Category) ->  NSDictionary {
    
    return NSDictionary(objects: [category.id, category.name, category.imageName], forKeys: [kOBJECTID as NSCopying, kNAME as NSCopying, kIMAGENAME as NSCopying])
}

//use one time

//func createCategorySet() {
//    let womenClothing = Category(_name: "Women's Clothing and Accesories", _imageName: "womensCloth")
//    let footwear = Category(_name: "Footwear", _imageName: "footwear")
//    let electronics = Category(_name: "Electronics", _imageName: "electronics")
//    let menClothing = Category(_name: "Men's Clothing", _imageName: "mensCloth")
//    let health = Category(_name: "Health", _imageName: "health")
//    let baby = Category(_name: "Baby", _imageName: "baby")
//    let home = Category(_name: "Home", _imageName: "home")
//    let car = Category(_name: "Car", _imageName: "car")
//    let luggage = Category(_name: "Luggage", _imageName: "luggage")
//    let jewelery = Category(_name: "Jewelery", _imageName: "jewelery")
//    let hobby = Category(_name: "Hobby", _imageName: "hobby")
//    let pet = Category(_name: "Pet", _imageName: "pet")
//    let industry = Category(_name: "Industry", _imageName: "industry")
//    let garden = Category(_name: "Garden", _imageName: "garden")
//    let camera = Category(_name: "Camera", _imageName: "camera")
//
//    let arrayOfCategories  = [womenClothing, footwear, electronics, menClothing, health, baby, home, car, luggage, jewelery, hobby, pet, industry, garden, camera]
//
//    for category in arrayOfCategories {
//        saveCategoryToFirebase(category)
//    }
//}
