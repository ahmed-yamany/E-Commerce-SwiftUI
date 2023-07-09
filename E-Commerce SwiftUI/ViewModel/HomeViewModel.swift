//
//  HomeViewModel.swift
//  E-Commerce SwiftUI
//
//  Created by Ahmed Yamany on 06/07/2023.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var productType: ProducstTypes = .Wearable
    @Published var products: [Product] = [
        Product(type: .Wearable,
                           title: "Smartwatch",
                           subTitle: "Fitness Tracker",
                           description: "Track your daily activities and monitor your health with this smartwatch.",
                           place: "Online Store",
                           productImage: "smartwatch",
                quantity: 10, price: "330$"),
    Product(type: .Laptobs,
                           title: "Laptop",
                           subTitle: "High-performance Notebook",
                           description: "Powerful laptop with a sleek design for all your computing needs.",
                           place: "Electronics Store",
                           productImage: "smartwatch",
            quantity: 5, price: "500$"),
    Product(type: .Phones,
                           title: "Smartphone",
                           subTitle: "Flagship Mobile Device",
                           description: "Stay connected and enjoy advanced features with this cutting-edge smartphone.",
                           place: "Mobile Store",
                           productImage: "smartwatch",
            quantity: 8, price: "400$"),

    Product(type: .Tablets,
                           title: "Tablet",
                           subTitle: "Versatile Touchscreen Device",
                           description: "Experience portable entertainment and productivity on a large, high-resolution display.",
                           place: "Electronics Store",
                           productImage: "smartwatch",
            quantity: 3, price: "100$"),
        Product(type: .Wearable,
                               title: "Apple Watch Series 6",
                               subTitle: "Smartwatch",
                               description: "The ultimate device for a healthy life. Measure your blood oxygen level, take an ECG anytime, and track your daily activity.",
                               place: "Apple Store",
                               productImage: "smartwatch",
                quantity: 10, price: "230$"),
        Product(type: .Phones,
                           title: "Smartphone",
                           subTitle: "Flagship Mobile Device",
                           description: "Stay connected and enjoy advanced features with this cutting-edge smartphone.",
                           place: "Mobile Store",
                           productImage: "smartwatch",
                quantity: 8, price: "120$"),

    Product(type: .Tablets,
                           title: "Tablet",
                           subTitle: "Versatile Touchscreen Device",
                           description: "Experience portable entertainment and productivity on a large, high-resolution display.",
                           place: "Electronics Store",
                           productImage: "smartwatch",
            quantity: 3, price: "200$"),
        Product(type: .Wearable,
                               title: "Apple Watch Series 6",
                               subTitle: "Smartwatch",
                               description: "The ultimate device for a healthy life. Measure your blood oxygen level, take an ECG anytime, and track your daily activity.",
                               place: "Apple Store",
                               productImage: "smartwatch",
                quantity: 10, price: "600$")

        ]
    
    @Published var filteredProducts: [Product] = []
    
    init() {
        filterProducts()
    }
    
    func filterProducts() {
        filteredProducts = products.lazy.filter {$0.type == productType}
    }
}
