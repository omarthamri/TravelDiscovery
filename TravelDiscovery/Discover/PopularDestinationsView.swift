//
//  PopularDestinationsView.swift
//  TravelDiscovery
//
//  Created by omar thamri on 5/12/2022.
//

import SwiftUI

struct PopularDestinationsView: View {
    var destinations: [Destination] = [
        .init(name: "Paris", country: "France", imageName: "paris"),
        .init(name: "Tokyo", country: "Japan", imageName: "japan"),
        .init(name: "New york", country: "US", imageName: "usa"),
    ]
    var body: some View {
        VStack {
            HStack {
                Text("Popular destinations")
                    .font(.system(size: 14,weight: .semibold))
                Spacer()
                Text("See all")
                    .font(.system(size: 12,weight: .semibold))
            }.padding(.horizontal)
                .padding(.top)
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(destinations, id: \.self) { destination in
                        VStack(alignment: .leading,spacing: 0) {
                            Image(destination.imageName)
                                .resizable()
                                .frame(width: 125, height: 125)
                                .scaledToFill()
                                .cornerRadius(4)
                                .padding(.horizontal,6)
                                .padding(.vertical,6)
                            Text(destination.name)
                                .font(.system(size: 12,weight: .semibold))
                                .padding(.horizontal,12)
                            Text(destination.country)
                                .font(.system(size: 12,weight: .semibold))
                                .padding(.horizontal,12)
                                .padding(.bottom,8)
                                .foregroundColor(.gray)
                        }
                            //.modifier(TileModifier())
                            .asTile()
                            .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularDestinationsView()
        DiscoverView()
    }
}
