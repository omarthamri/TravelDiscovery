//
//  CategoriesDetailsView.swift
//  TravelDiscovery
//
//  Created by omar thamri on 6/12/2022.
//

import SwiftUI
import Kingfisher

struct CategoriesDetailsView: View {
    @ObservedObject private var vm: CategoryDetailsViewModel
    private var name: String
    init(name: String) {
        self.name = name
        vm = .init(name: name)
    }
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
                    if !vm.errorMessage.isEmpty {
                        VStack(spacing: 12) {
                            Image(systemName: "xmark.octagon.fill")
                                .font(.system(size: 64,weight: .semibold))
                                .foregroundColor(.red)
                            Text(vm.errorMessage)
                        }
                    }
                ScrollView{
                    ForEach(vm.places, id: \.self) { place in
                        VStack(alignment: .leading, spacing: 0) {
                            KFImage(URL(string: place.thumbnail))
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
        .navigationBarTitle(name,displayMode:.inline)
        
    }
}

struct CategoriesDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
