//
//  UserDetailView.swift
//  TravelDiscovery
//
//  Created by omar thamri on 11/12/2022.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                Image(user.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding(.horizontal)
                    .padding(.top)
                Text("Amy Adams")
                    .font(.system(size: 14,weight: .semibold))
                HStack {
                    Text("@amyadams20 •")
                        .font(.system(size: 12,weight:.regular))
                    Image(systemName: "hand.thumbsup.fill")
                        .font(.system(size: 10,weight: .semibold))
                    Text("2541")
                        .font(.system(size: 12,weight:.regular))
                }
                Text("Youtuber, Vlogger, Content Creator")
                    .font(.system(size: 12,weight:.regular))
                    .foregroundColor(.gray)
                HStack(spacing: 12) {
                    VStack {
                        Text("59,398")
                            .font(.system(size: 13,weight:.regular))
                        Text("followers")
                            .font(.system(size: 9,weight:.semibold))
                    }
                    Spacer()
                        .frame(width: 0.5, height: 12)
                        .background(Color(.lightGray))
                    VStack {
                        Text("2,112")
                            .font(.system(size: 13,weight:.regular))
                        Text("following")
                            .font(.system(size: 9,weight:.semibold))
                    }
                }
                HStack(spacing: 12) {
                    Button {
                        
                    } label: {
                        HStack {
                            Spacer()
                        Text("follow")
                                .font(.system(size: 12,weight:.semibold))
                                .foregroundColor(.white)
                           Spacer()
                        }
                        .padding(.vertical,8)
                        .background(Color.orange)
                        .cornerRadius(100)
                    }
                    Button {
                        
                    } label: {
                        HStack {
                            Spacer()
                        Text("contact ")
                                .font(.system(size: 12,weight:.semibold))
                                .foregroundColor(.black)
                           Spacer()
                        }
                        .padding(.vertical,8)
                        .background(Color(white: 0.9))
                        .cornerRadius(100)
                    }
                }
                ForEach(0..<5,id: \.self) { num in
                    VStack(alignment: .leading) {
                        Image("japan")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                        HStack {
                            Image("amy")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 34)
                                .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text("here is my post")
                                    .font(.system(size: 14,weight: .semibold))
                                Text("500k views")
                                    .font(.system(size: 12,weight: .regular))
                            }
                            
                        }.padding(.horizontal,8)
                        HStack {
                            ForEach(0..<3,id: \.self) {num in
                                Text("#traveling")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 14,weight:.semibold))
                                    .padding(.horizontal,12)
                                    .padding(.vertical,4)
                                    .background(Color(white: 0.9))
                                    .cornerRadius(20)
                            }
                        }.padding(.bottom)
                            .padding(.horizontal,8)
                        
                    }
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .init(white: 0.8), radius: 5, x: 0, y: 4)
                }
                

            }.padding(.horizontal)
        }.navigationBarTitle(user.name,displayMode: .inline)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        UserDetailView(user: .init(name: "Amy Adams", imageName: "amy"))
        }
    }
}
