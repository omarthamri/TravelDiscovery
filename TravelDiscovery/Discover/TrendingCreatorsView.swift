//
//  TrendingCreatorsView.swift
//  TravelDiscovery
//
//  Created by omar thamri on 6/12/2022.
//

import SwiftUI

struct TrendingCreatorsView: View {
    var users: [User] = [
        .init(name: "Amy Adams", imageName: "amy"),
        .init(name: "Billy Childs", imageName: "billy"),
        .init(name: "Sam Smith", imageName: "sam"),
    ]
    var body: some View {
        VStack {
            HStack {
                Text("Trending creators")
                    .font(.system(size: 14,weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12,weight: .semibold))
            }.padding(.horizontal)
                .padding(.top)
            ScrollView(.horizontal) {
                HStack(alignment: .top,spacing: 12) {
                    ForEach(users, id: \.self) { user in
                        NavigationLink {
                            UserDetailView(user: user)
                        } label: {
                            DiscoverUserView(user: user)
                        }

                        
                            
                    }
                }.padding(.horizontal)
                    .padding(.bottom)
            }
        }
    }
}

struct DiscoverUserView: View {
    var user: User
    var body: some View {
        VStack {
            Image(user.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .cornerRadius(.infinity)
            Text(user.name)
                .font(.system(size: 11,weight: .semibold))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(.label))
        }
        .frame(width: 60)
            .shadow(color: .gray, radius: 4, x: 0, y: 2)
    }
}

struct TrendingCreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
