//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by omar thamri on 4/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color.yellow,Color.orange], startPoint: .top, endPoint: .center)
                    .ignoresSafeArea()
                Color(.init(white: 0.95, alpha: 1))
                    .offset(y: 400)
                ScrollView {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("where do you want to go?")
                        Spacer()
                    }
                    .font(.system(size: 14,weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.3)))
                    .cornerRadius(10)
                    .padding(16)
                        DiscoverCategoriesView()
                    VStack {
                        PopularDestinationsView()
                        PopularRestaurantsView()
                        TrendingCreatorsView()
                    }
                    .background(Color(.init(white: 0.95, alpha: 1)))
                    .cornerRadius(16)
                    .padding(.top,32)
                        
                }
            }
            .navigationTitle("Discover")
        }
    }
}

struct Destination: Hashable {
    var name,country,imageName: String
}

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
                         //   .frame(width: 125)
                        .background(Color.white)
                            .cornerRadius(5)
                            .shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 4, x: 0, y: 2)
                            .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct Restaurant: Hashable {
    var name,imageName: String
}

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
                            .frame(width: 240)
                            .background(Color.white)
                            .cornerRadius(5)
                            .shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 4, x: 0, y: 2)
                            .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct User: Hashable {
    var name,imageName: String
    
}

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
                        VStack {
                            Image(user.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .cornerRadius(.infinity)
                            Text(user.name)
                                .font(.system(size: 11,weight: .semibold))
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 60)
                            .shadow(color: .gray, radius: 4, x: 0, y: 2)
                            .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Category: Hashable {
    let name,imageName: String
}

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
