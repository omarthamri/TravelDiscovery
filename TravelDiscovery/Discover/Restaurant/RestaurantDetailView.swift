//
//  RestaurantDetailView.swift
//  TravelDiscovery
//
//  Created by omar thamri on 10/12/2022.
//

import SwiftUI
import Kingfisher

struct RestaurantDetails: Decodable {
    let description: String
    let popularDishes: [Dish]
}

struct Dish: Decodable,Hashable {
    let name,price,photo: String
    let numPhotos: Int
}

class RestaurantDetailViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var details: RestaurantDetails?
    init() {
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/restaurant?id=0"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, response, err in
            guard let data = data else {return}
            DispatchQueue.main.async {
            do {
                self.details = try JSONDecoder().decode(RestaurantDetails.self, from: data)
            } catch {
                print("failed to parse json",error)
            }
            }
            
        }.resume()
    }
}

struct RestaurantDetailView: View {
    let restaurant: Restaurant
    @ObservedObject var vm = RestaurantDetailViewModel()
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
                Text(vm.details?.description ?? "")
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
                    ForEach(vm.details?.popularDishes ?? [] , id: \.self) { dish in
                        DishCell(dish: dish)
                    }
                    
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitle("Restaurant details",displayMode: .inline)
    }
    let sampleDishPhotos = ["https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/e2f3f5d4-5993-4536-9d8d-b505d7986a5c","https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/a4d85eff-4c79-4141-a0d6-761cca48eae1"]
}

struct DishCell: View {
    var dish: Dish
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomLeading) {
                KFImage(URL(string: dish.photo))
                    .resizable()
                    .scaledToFill()
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray))
                    .shadow(radius: 2)
                    .padding(.vertical,2)
                LinearGradient(colors: [.clear,.black], startPoint: .center, endPoint: .bottom)
                Text(dish.price)
                    .foregroundColor(Color(.white))
                    .font(.system(size: 13,weight: .bold))
                    .padding(.horizontal,6)
                    .padding(.vertical,4)
                    
            }.frame(height: 100)
                .cornerRadius(5)
            
            Text(dish.name)
                .font(.system(size: 14,weight: .bold))
            Text("\(dish.numPhotos) photos")
                .foregroundColor(.gray)
                .font(.system(size: 12,weight: .regular))
            
        }
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantDetailView(restaurant: Restaurant(name: "japan's finest tapas", imageName: "tapas"))
        }
    }
}
