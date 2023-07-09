//
//  MainTabView.swift
//  E-Commerce SwiftUI
//
//  Created by Ahmed Yamany on 06/07/2023.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: TabViewCases = .Home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        VStack(spacing: 0.0) {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(TabViewCases.Home)
                Text("Liked")
                    .tag(TabViewCases.Liked)
                Text("Cart")
                    .tag(TabViewCases.Cart)
                Text("Profile")
                    .tag(TabViewCases.Profile)
                
            }
            
            HStack {
                ForEach(TabViewCases.allCases, id: \.self) { tab in
                    Image(systemName: tab.rawValue)
                        .resizable()
                        .frame(width: 22, height: 22)
                        .background {
                            Color("purple")
                                .opacity(0.1)
                                .cornerRadius(5)
                                .blur(radius: 5)
                                .padding(-7)
                                .opacity(selectedTab == tab ? 1 : 0)
                        }
                        .frame(maxWidth: .infinity)
                        .foregroundColor(selectedTab == tab ? Color("purple") : .black.opacity(0.3))
                        .onTapGesture {
                            selectedTab = tab
                        }
                }
            }
            .padding([.horizontal, .bottom])
            .padding(.bottom, 10)
            .background(Color.gray.opacity(0.1))

        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}


enum TabViewCases: String, CaseIterable {
    case Home = "house.fill"
    case Liked = "heart.fill"
    case Profile = "person.fill"
    case Cart = "cart.fill"
}
