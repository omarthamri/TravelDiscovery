//
//  DestinationHeaderContainer.swift
//  TravelDiscovery
//
//  Created by omar thamri on 8/12/2022.
//

import SwiftUI

struct DestinationHeaderContainer: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let redVC = UIViewController()
        redVC.view.backgroundColor = .red
        return redVC
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    
    typealias UIViewControllerType = UIViewController
    
    
}

struct DestinationHeaderContainer_Previews: PreviewProvider {
    static var previews: some View {
        DestinationHeaderContainer()
    }
}
