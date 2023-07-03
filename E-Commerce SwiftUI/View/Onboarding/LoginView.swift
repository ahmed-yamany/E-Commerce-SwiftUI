//
//  LoginView.swift
//  E-Commerce SwiftUI
//
//  Created by Ahmed Yamany on 03/07/2023.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            Text("Welcome\nBack")
                .foregroundColor(.white)
                .font(.system(size: 50))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: screenBounds().height / 3.5)
                .padding(.leading, 30)
                .background(
                    ZStack {
                        LinearGradient(colors: [.purple, .purple.opacity(0.5), Color("purple")], startPoint: .top, endPoint: .bottom)
                            .clipShape(Circle())
                            .frame(width: 100, height: 100)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                            .padding(.trailing)
                            .offset(y: -20)
                            .ignoresSafeArea()
                        
                        Circle()
                            .strokeBorder(Color.white.opacity(0.3), lineWidth: 3)
                            .frame(width: 30, height: 30)
                            .blur(radius: 3)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                            .padding()
                        
                        Circle()
                            .strokeBorder(Color.white.opacity(0.3), lineWidth: 3)
                            .frame(width: 30, height: 30)
                            .blur(radius: 3)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .padding()
                    }
                )
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text("Login")
                        .font(.system(size: 22))
                        .fontWeight(.semibold)
                    
                    VStack(spacing: 20) {
                        customTextField(title: "Email", icon: "envelope", hint: "yamany@gmail.com", value: $loginViewModel.email, isPassword: false)
                        
                        customTextField(title: "Password", icon: "lock", hint: "123456", value: $loginViewModel.password,isPassword: true, showPassword: $loginViewModel.showPassword)
                        
                        if loginViewModel.registerUser {
                            customTextField(title: "Re-Enter Password", icon: "lock", hint: "123456", value: $loginViewModel.reEnterPassword, isPassword: true, showPassword: $loginViewModel.showReEnterPassword)
                        }     
                    }
                    .padding(.top)
                    
                    // Forgot Password
                    Button {
                        loginViewModel.forgotPassword()
                    } label: {
                        Text("Forgot Password")
                            .font(Font.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("purple"))
                    }
                    .padding(.top, 8)
                    
                    // Login  / Register Button
                    Button {
                        loginViewModel.registerUser ? loginViewModel.register() : loginViewModel.login()
                    } label: {
                        Text(loginViewModel.registerUser ? "Register" : "Login")
                            .font(Font.system(size: 17))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .background(Color("purple"))
                            .cornerRadius(15, corners: .allCorners)
                    }
                    .padding(.top, 25)
                    .padding(.horizontal)
                    
                    // Login / Register Toggle
                    Button {
                        withAnimation {
                            loginViewModel.registerUser.toggle()
                        }
                    } label: {
                        Text(!loginViewModel.registerUser ? "Create Account" : "Back To Login")
                            .font(Font.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("purple"))
                    }
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .center)

                }
                .padding(30)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.white)
            .cornerRadius(25, corners: [.topLeft, .topRight])
            .ignoresSafeArea()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("purple"))
        .onChange(of: loginViewModel.registerUser) { newValue in
            loginViewModel.email = ""
            loginViewModel.password = ""
            loginViewModel.reEnterPassword = ""
            loginViewModel.showPassword = false
            loginViewModel.showReEnterPassword = false
        }
    }
    
    @ViewBuilder
    private func customTextField(title: String,
                                 icon: String,
                                 hint: String,
                                 value: Binding<String>,
                                 isPassword: Bool,
                                 showPassword: Binding<Bool> = .constant(true)) -> some View {
        VStack(alignment: .leading) {
            Label {
                Text(title)
                    .font(.system(size: 14))
            } icon: {
                Image(systemName: icon)
            }
            .foregroundColor(.black.opacity(0.8))
            if showPassword.wrappedValue {
                TextField(hint, text: value)
                    .padding(.top, 2)
            }else {
                SecureField(hint, text: value)
                    .padding(.top, 2)
            }
            Divider()
                .background(.black.opacity(0.4))
        }
        .overlay(alignment: .trailing) {
            if isPassword {
                Button {
                    showPassword.wrappedValue.toggle()
                } label: {
                    Text(showPassword.wrappedValue ? "Hide" : "Show")
                        .font(.caption)
                        .foregroundColor(Color("purple"))
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
