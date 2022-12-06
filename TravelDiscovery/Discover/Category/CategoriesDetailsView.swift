//
//  CategoriesDetailsView.swift
//  TravelDiscovery
//
//  Created by omar thamri on 6/12/2022.
//

import SwiftUI
import Kingfisher

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
        .navigationBarTitle("Category",displayMode:.inline)
        
    }
}

struct CategoriesDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesDetailsView()
    }
}
