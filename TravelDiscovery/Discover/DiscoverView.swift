//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by omar thamri on 4/12/2022.
//

import SwiftUI

extension Color {
    static let discoverBackgroundColor = Color(.init(white: 0.95, alpha: 1))
    static let defaultBackground = Color("defaultBackground")
    static let tileBackround = Color("tileBackground")
}

struct DiscoverView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color.yellow,Color.orange], startPoint: .top, endPoint: .center)
                    .ignoresSafeArea()
                Color.discoverBackgroundColor
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
                    .background(Color.defaultBackground)
                    .cornerRadius(16)
                    .padding(.top,32)
                        
                }
            }
            .navigationTitle("Discover")
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
            .colorScheme(.dark)
        DiscoverView()
            .colorScheme(.light)
    }
}
