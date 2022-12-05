//
//  DiscoverCategoriesView.swift
//  TravelDiscovery
//
//  Created by omar thamri on 6/12/2022.
//

import SwiftUI

struct DiscoverCategoriesView: View {
    var categories: [Category] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sport", imageName: "sportscourt.fill"),
        .init(name: "Live events", imageName: "music.mic"),
        .init(name: "Food", imageName: "music.mic"),
        .init(name: "History", imageName: "music.mic"),
    ]
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(alignment: .top, spacing: 14) {
            ForEach(categories, id: \.self) { category in
                VStack(spacing: 8) {
                    Image(systemName: category.imageName)
                        .font(.system(size: 20))
                        .foregroundColor(.orange)
                        .frame(width: 64, height: 64)
                        .background(.white)
                        .cornerRadius(.infinity)
                    Text(category.name)
                        .font(.system(size: 12,weight: .semibold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }.frame(width: 68)
            }
        }.padding(.horizontal)
        }
    }
}

struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverCategoriesView()
    }
}
