//
//  PopularRestaurantsView.swift
//  TravelDiscovery
//
//  Created by omar thamri on 6/12/2022.
//

import SwiftUI

struct PopularRestaurantsView: View {
    var restaurants: [Restaurant] = [
        .init(name: "Japan's finest tapas", imageName: "tapas"),
        .init(name: "Bar & Grill", imageName: "bar_grill"),
    ]
    var body: some View {
        VStack {
            HStack {
                Text("Popular places to eat")
                    .font(.system(size: 14,weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12,weight: .semibold))
            }.padding(.horizontal)
                .padding(.top)
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(restaurants, id: \.self) { restaurant in
                        NavigationLink {
                            RestaurantDetailView(restaurant: restaurant)
                        } label: {
                            RestaurantTile(restaurant: restaurant)
                                .frame(width: 240)
                                //.modifier(TileModifier())
                                .asTile()
                                .padding(.bottom)
                                .foregroundColor(Color(.label))
                        }
                        
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct RestaurantTile: View {
    let restaurant: Restaurant
    var body: some View {
        HStack(spacing: 8) {
            Image(restaurant.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60 )
                .clipped()
                .cornerRadius(5)
                .padding(.leading,6)
                .padding(.vertical,6)
            VStack(alignment: .leading,spacing: 6) {
                HStack {
                    Text(restaurant.name)
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.gray)
                    })
                    
                }
            
                HStack {
                    Image(systemName: "star.fill")
                    Text("4.7 • Sushi • $$")
                }
            Text("Tokyo, Japan")
            }
            .font(.system(size: 12,weight: .semibold))
            Spacer()
        }
    }
}

struct PopularRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
