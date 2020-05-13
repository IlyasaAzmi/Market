//
//  FirebaseCollectionReference.swift
//  Market
//
//  Created by Ilyasa' Azmi on 13/05/20.
//  Copyright © 2020 Ilyasa' Azmi. All rights reserved.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference: String {
    case User
    case Category
    case Items
    case Basket
    
}

func FirebaseReference(_ collectionReference: FCollectionReference) -> CollectionReference {
    
    return Firestore.firestore().collection(collectionReference.rawValue)
}
