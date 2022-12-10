//
//  RestaurantDetailView.swift
//  TravelDiscovery
//
//  Created by omar thamri on 10/12/2022.
//

import SwiftUI

struct RestaurantDetailView: View {
    let restaurant: Restaurant
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomLeading) {
            Image(restaurant.imageName)
                .resizable()
                .scaledToFill()
                LinearGradient(colors: [Color.clear,Color.black], startPoint: .center, endPoint: .bottom)
                HStack {
                    VStack(alignment: .leading,spacing: 4) {
                    Text(restaurant.name)
                        .foregroundColor(.white)
                        .font(.system(size: 18,weight: .bold))
                        HStack {
                            ForEach(0..<5, id: \.self) { num in
                                Image(systemName: "star.fill")
                                    .foregroundColor(.orange)
                            }
                        }
                    }
                    Spacer()
                    Text("see more photos")
                        .foregroundColor(.white)
                        .font(.system(size: 14,weight: .regular))
                        .frame(width: 80)
                        .multilineTextAlignment(.trailing)
                }.padding()
                
            }
            VStack(alignment: .leading,spacing: 8) {
                Text("Location & Description")
                    .font(.system(size: 16,weight:.bold))
                Text("Tokyo, Japan")
                HStack {
                    ForEach(0..<5, id: \.self) { num in
                        Image(systemName: "dollarsign.circle.fill")
                            .foregroundColor(.orange)
                    }
                }
                Text("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb")
                    .padding(.top,8)
                    .font(.system(size: 14,weight:.regular))
            }.padding()
            HStack {
                Text("Popular dishes")
                    .font(.system(size: 16,weight:.bold))
                Spacer()
            }
            .padding(.horizontal)
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0..<5, id: \.self) { num in
                        VStack(alignment: .leading) {
                            Image("tapas")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 100)
                                .cornerRadius(5)
                                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                                .shadow(radius: 2)
                                .padding(.vertical,2)
                            Text("Japanese tapas")
                                .font(.system(size: 14,weight: .bold))
                            Text("88 photos")
                                .foregroundColor(.gray)
                                .font(.system(size: 12,weight: .regular))
                            
                        }
                    }
                    
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitle("Restaurant details",displayMode: .inline)
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantDetailView(restaurant: Restaurant(name: "japan's finest tapas", imageName: "tapas"))
        }
    }
}
