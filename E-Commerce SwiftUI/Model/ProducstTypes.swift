//
//  ProducstsTypes.swift
//  E-Commerce SwiftUI
//
//  Created by Ahmed Yamany on 06/07/2023.
//

import Foundation

struct Product: Identifiable, Hashable {
    let id = UUID().uuidString
    var type: ProducstTypes
    var title: String
    var subTitle: String
    var description: String
    var place: String
    var productImage: String
    var quantity: Int
    var price: String
}

enum ProducstTypes: String, CaseIterable {
    case Wearable, Laptobs, Phones, Tablets
}
