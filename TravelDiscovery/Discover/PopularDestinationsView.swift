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
                        NavigationLink {
                            PopularDestinationDetailView(destination: destination)
                        } label: {
                            popularDestinationTile(destination: destination)
                                .padding(.bottom)
                        }
                        
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct PopularDestinationDetailView: View {
    var destination: Destination
    var body: some View {
        ScrollView {
            Image(destination.imageName)
                .resizable()
                .scaledToFill()
            VStack(alignment: .leading) {
                Text(destination.name)
                    .font(.system(size: 18,weight: .bold))
                Text(destination.country)
                HStack {
                ForEach (0..<5,id: \.self) { num in
                    Image(systemName: "star.fill")
                        .foregroundColor(.orange)
                }
                }
                .padding(.top,2)
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                    .padding(.top,8)
                HStack { Spacer() }
            }
            .padding(.horizontal)
            
        }.navigationBarTitle(destination.name,displayMode: .inline)
    }
}

struct popularDestinationTile: View {
    let destination: Destination
    var body: some View {
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
                .foregroundColor(Color(.label))
            Text(destination.country)
                .font(.system(size: 12,weight: .semibold))
                .padding(.horizontal,12)
                .padding(.bottom,8)
                .foregroundColor(.gray)
        }
            //.modifier(TileModifier())
            .asTile()
    }
}

struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PopularDestinationDetailView(destination: Destination(name: "Paris", country: "france", imageName: "paris"))
        }
        DiscoverView()
    }
}
