//
//  LoginViewModel.swift
//  E-Commerce SwiftUI
//
//  Created by Ahmed Yamany on 03/07/2023.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    // Login
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    
    // Register
    @Published var registerUser: Bool = false
    @Published var reEnterPassword: String = ""
    @Published var showReEnterPassword: Bool = false
    
    
    func forgotPassword() {
        
    }
    func login() {}
    func register() {}
}
