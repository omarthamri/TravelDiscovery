//
//  UserDetailView.swift
//  TravelDiscovery
//
//  Created by omar thamri on 11/12/2022.
//

import SwiftUI
import Kingfisher

struct UserDetails: Decodable {
    let username,firstName,lastName,profileImage: String
    let followers,following: Int
    let posts : [Post]
}

struct Post: Decodable,Hashable {
    let title,imageUrl,views: String
    let hashtags: [String]
}

class UserDetailViewModel: ObservableObject {
    @Published var userDetails: UserDetails?
    init(userId: Int) {
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/user?id=\(userId)") else {return}
        URLSession.shared.dataTask(with: url) { data, resp, err in
            DispatchQueue.main.async {
                guard let data = data else {return}
                do {
                    self.userDetails = try JSONDecoder().decode(UserDetails.self, from: data)
                } catch let jsonError {
                    print("failed to decode json",jsonError)
                }
            }
            
        }.resume()
    }
}

struct UserDetailView: View {
    @ObservedObject var vm: UserDetailViewModel
    let user: User
    
    init(user: User) {
        self.user = user
        self.vm = .init(userId: user.id)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                KFImage(URL(string: vm.userDetails?.profileImage ?? ""))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding(.horizontal)
                    .padding(.top)
                Text("\(vm.userDetails?.firstName ?? "") \(vm.userDetails?.lastName ?? "")")
                    .font(.system(size: 14,weight: .semibold))
                HStack {
                    Text(vm.userDetails?.username ?? "")
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
                ForEach(vm.userDetails?.posts ?? [],id: \.self) { post in
                    PostView(post: post, user: user)
                }
                

            }.padding(.horizontal)
        }.navigationBarTitle(user.name,displayMode: .inline)
    }
}

struct PostView: View {
    var post: Post
    var user: User
    var body: some View {
            VStack(alignment: .leading) {
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                HStack {
                    Image(user.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 34)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.system(size: 14,weight: .semibold))
                        Text("\(post.views) views")
                            .font(.system(size: 12,weight: .regular))
                    }
                    
                }.padding(.horizontal,8)
                HStack {
                    ForEach(post.hashtags,id: \.self) {hashtag in
                        Text("#\(hashtag)")
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
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
        NavigationView {
            UserDetailView(user: .init(id: 0, name: "Amy Adams", imageName: "amy"))
        }
    }
}
