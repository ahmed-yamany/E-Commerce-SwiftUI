//
//  Splash.swift
//  E-Commerce SwiftUI
//
//  Created by Ahmed Yamany on 03/07/2023.
//

import SwiftUI

struct SplashView: View {
    @State private var showLoginView: Bool = false
    
    var body: some View {
        VStack {
            Text("Find Your\nGadget")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(2)
            
            Image("splashImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Button {
                withAnimation {
                    showLoginView = true
                }
            } label: {
                Text("Get Started")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .padding(.vertical, 18)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(10)
                    .foregroundColor(Color("purple"))
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
            }
            .padding(.horizontal, 30)
            .offset(y: screenBounds().height < 750 ? 20 : 60)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .padding(.top, screenBounds().height < 750 ? 0 : 20)
        .background(Color("purple"))
        .fullScreenCover(isPresented: $showLoginView) {
            LoginView()
        }
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

func screenBounds() -> CGRect { UIScreen.main.bounds }
