//
//  PopularDestinationsView.swift
//  TravelDiscovery
//
//  Created by omar thamri on 5/12/2022.
//

import SwiftUI
import MapKit

struct PopularDestinationsView: View {
    var destinations: [Destination] = [
        .init(name: "Paris", country: "France", imageName: "paris", latitude: 48.875002, longitude: 2.355103),
        .init(name: "Tokyo", country: "Japan", imageName: "japan", latitude: 35.545965, longitude: 139.643443),
        .init(name: "New york", country: "US", imageName: "usa", latitude: 40.709951, longitude: -74.007596),
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
    @State var region: MKCoordinateRegion
    var destination: Destination
    @State var isShowingAttractions = true
    let imageUrlStrings = ["https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/7156c3c6-945e-4284-a796-915afdc158b5","https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/b1642068-5624-41cf-83f1-3f6dff8c1702","https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/2240d474-2237-4cd3-9919-562cd1bb439e"]
    
    init(destination: Destination) {
        self.destination = destination
        self._region = State(initialValue: MKCoordinateRegion(center: .init(latitude: destination.latitude, longitude: destination.longitude), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)))
    }
    var body: some View {
        ScrollView {
            DestinationHeaderContainer(imageUrlStrings: imageUrlStrings)
                .frame(height: 250)
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
                    .font(.system(size: 14))
                HStack { Spacer() }
                HStack {
                Text("Location")
                    .font(.system(size: 18,weight: .semibold))
                    Spacer()
                    Button(action: {isShowingAttractions.toggle()}) {
                        Text("\(isShowingAttractions ? "Hide" : "Show") attractions")
                            .font(.system(size: 12,weight: .semibold))
                    }
                    Toggle("", isOn: $isShowingAttractions)
                        .labelsHidden()
                }
            }
            .padding(.horizontal)
            Map(coordinateRegion: $region, annotationItems: isShowingAttractions ? attractions : []) { attraction in
               // MapMarker(coordinate: .init(latitude: attraction.latitude, longitude: attraction.longitude), tint: .red)
                MapAnnotation(coordinate:  .init(latitude: attraction.latitude, longitude: attraction.longitude)) {
                    CustomMapAnnotation(attraction: attraction)
                }
            }
                .frame(height: 300)
            
        }.navigationBarTitle(destination.name,displayMode: .inline)
    }
    let attractions: [Attraction] = [
        .init(name: "eiffel tour", imageName: "paris", longitude: 2.355103 , latitude: 48.875002),
        .init(name: "champs elysées", imageName: "japan", longitude: 2.311780, latitude: 48.866867)
    ]
}

struct CustomMapAnnotation: View {
    
    var attraction: Attraction
    var body: some View {
        VStack {
            Image(attraction.imageName)
                .resizable()
                .frame(width:80, height:60)
                .cornerRadius(4)
                .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.init(white: 0, opacity: 0.5))
                )
            Text(attraction.name)
                .font(.system(size: 12,weight: .semibold))
                .padding(.horizontal,6)
                .padding(.vertical,4)
                .background(.linearGradient(colors: [Color.red,Color.blue], startPoint: .leading, endPoint: .trailing))
                .foregroundColor(.white)
                .cornerRadius(4)
                .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.init(white: 0, opacity: 0.5))
                )
        }
        .shadow(radius: 5)
    }
}

struct Attraction: Identifiable {
    var id = UUID().uuidString
    var name,imageName: String
    var longitude,latitude: Double
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
            PopularDestinationDetailView(destination: Destination(name: "Paris", country: "france", imageName: "paris", latitude: 48.875002, longitude: 2.355103))
        }
        DiscoverView()
    }
}
