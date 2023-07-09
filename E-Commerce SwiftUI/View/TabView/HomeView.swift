//
//  HomeView.swift
//  E-Commerce SwiftUI
//
//  Created by Ahmed Yamany on 06/07/2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @Namespace var animation
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 15.0) {
                /// Search TF
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search", text: .constant(""))
                }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    .background {
                        Capsule()
                            .strokeBorder(Color.gray, lineWidth: 0.8)
                    }
                    .frame(width: screenBounds().width / 1.6)
                Text("Order Online\nCollect in Store")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal, 25)
                
                /// ProductTypes
                HStack(spacing: 15.0) {
                    ForEach(ProducstTypes.allCases, id: \.self) { type in
                        productTypeView(type: type)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 25)
                .padding(.vertical, 30)
                
                /// Products Card View
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20.0) {
                        ForEach(viewModel.filteredProducts) { product in
                            productCardView(product: product)
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.vertical)
        }
        .background(Color.gray.opacity(0.1))
        .onChange(of: viewModel.productType) { newValue in viewModel.filterProducts()}
    }
    
    @ViewBuilder
    private func productTypeView(type: ProducstTypes) -> some View {
        Button(type.rawValue) {
            withAnimation {
                viewModel.productType = type
            }
        }
        .foregroundColor(viewModel.productType == type ? Color("purple") : .gray)
        .padding(.bottom)
        .overlay {
            if viewModel.productType == type {
                Capsule()
                    .matchedGeometryEffect(id: "PRODUCTTABED", in: animation)
                    .frame(height: 2)
                    .padding(.top)
                    .padding(.horizontal, -5)
                    .foregroundColor(Color("purple"))
            }
        }
    }
    @ViewBuilder
    private func productCardView(product: Product) -> some View {
        VStack(spacing: 10.0) {
            Image(product.productImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: screenBounds().width / 2.6)
                .offset(y: -80)
                .padding(.bottom, -80)
            
            Text(product.title)
                .font(.system(size: 18))
                .fontWeight(.bold)
                .padding(.top)
            Text(product.subTitle)
                .font(.system(size: 14))
                .foregroundColor(.gray)
            Text(product.price)
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundColor(Color("purple"))
        }
        .padding(.horizontal)
        .padding(.bottom)
        .background(
            Color.white
                .cornerRadius(25)
        )
        .padding(.top, 80)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
