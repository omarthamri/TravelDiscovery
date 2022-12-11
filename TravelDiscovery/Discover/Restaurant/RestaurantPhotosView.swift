//
//  RestaurantPhotosView.swift
//  TravelDiscovery
//
//  Created by omar thamri on 11/12/2022.
//

import SwiftUI

struct RestaurantPhotosView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.fixed(125),spacing: 4),GridItem(.fixed(125),spacing: 4),GridItem(.fixed(125))],spacing: 4) {
                ForEach(0..<15, id: \.self) { num in
                    Text("placeholder")
                        .padding()
                        .background(Color.red)
                }
            }
        }.navigationBarTitle("All photos",displayMode: .inline)
    }
}

struct RestaurantPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        RestaurantPhotosView()
        }
        NavigationView {
            RestaurantDetailView(restaurant: Restaurant(name: "japan's finest tapas", imageName: "tapas"))
        }
    }
}
