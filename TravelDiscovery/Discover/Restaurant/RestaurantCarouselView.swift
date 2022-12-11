//
//  RestaurantCarouselView.swift
//  TravelDiscovery
//
//  Created by omar thamri on 11/12/2022.
//

import SwiftUI

import SwiftUI
import Kingfisher

struct RestaurantCarouselView: UIViewControllerRepresentable {
    var imageUrlStrings: [String]
    func makeUIViewController(context: Context) -> UIViewController {
        let pvc = CarouselPageViewController(imageUrlStrings: imageUrlStrings)
        return pvc
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    
    typealias UIViewControllerType = UIViewController
    
    
}

class CarouselPageViewController: UIPageViewController,UIPageViewControllerDataSource,UIPageViewControllerDelegate {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return allControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else {return nil}
        if index == 0 {
            return nil
        }
        return allControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else { return nil }
        if index == allControllers.count - 1 {
            return nil
        }
        return allControllers[index + 1]
    }
    
    var allControllers: [UIViewController] = []
    
    init(imageUrlStrings: [String]) {
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray5
        UIPageControl.appearance().currentPageIndicatorTintColor = .purple
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        allControllers = imageUrlStrings.map({ imageName in
            let hostingController = UIHostingController(rootView:
                                                            ZStack {
                Color.black
                KFImage(URL(string: imageName)).resizable().scaledToFit()
            })
            hostingController.view.clipsToBounds = true
            return hostingController
        })
        if let first = allControllers.first {
            setViewControllers([allControllers.first!], direction: .forward, animated: true )
        }
        
        self.dataSource = self
        self.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct RestaurantCarouselView_Previews: PreviewProvider {
    static let imageUrlStrings = ["https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/7156c3c6-945e-4284-a796-915afdc158b5","https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/b1642068-5624-41cf-83f1-3f6dff8c1702","https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/2240d474-2237-4cd3-9919-562cd1bb439e"]
    static var previews: some View {
        NavigationView {
            PopularDestinationDetailView(destination: Destination(name: "Paris", country: "france", imageName: "paris", latitude: 48.875002, longitude: 2.355103))
        }
        DestinationHeaderContainer(imageUrlStrings: imageUrlStrings)
            .frame(height:300)
    }
}
