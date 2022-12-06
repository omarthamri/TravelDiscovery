//
//  DiscoverCategoriesView.swift
//  TravelDiscovery
//
//  Created by omar thamri on 6/12/2022.
//

import SwiftUI

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
                    NavigationLink {
                        CategoriesDetailsView()
                    } label: {
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
            }
        }.padding(.horizontal)
        }
    }
}

struct ActivityIndicatorView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        aiv.color = .white
        return aiv
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
    
    typealias UIViewType = UIActivityIndicatorView
}

struct Place: Decodable,Hashable {
    var name,thumbnail: String
}

class CategoryDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var places = [Place]()
    @Published var errorMessage = ""
    init() {
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=art") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                self.places = try JSONDecoder().decode([Place].self,from: data)
            } catch {
                print("failed to decode json:",error)
                self.errorMessage = error.localizedDescription
            }
            self.isLoading = false
        }.resume()
        
    }
}

struct CategoriesDetailsView: View {
    @ObservedObject var vm = CategoryDetailsViewModel()
    var body: some View {
        ZStack {
            if vm.isLoading {
                VStack {
                ActivityIndicatorView()
                Text("Loading..")
                        .foregroundColor(.white)
                        .font(.system(size: 16,weight: .semibold))
                }
                .padding()
                .background(.black)
                .cornerRadius(8)
                    
            } else {
                ZStack {
                    Text(vm.errorMessage)
                ScrollView{
                    ForEach(vm.places, id: \.self) { place in
                        VStack(alignment: .leading, spacing: 0) {
                            Image("art1")
                                .resizable()
                                .scaledToFill()
                            Text(place.name)
                                .font(.system(size: 12,weight: .semibold))
                                .padding()
                        }
                        .asTile()
                        .padding()
                    }
                    
                }
            }
            }
        }
        .navigationBarTitle("Category",displayMode:.inline)
        
    }
}

struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoriesDetailsView()
        }
        DiscoverView()
    }
}
