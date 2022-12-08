//
//  DestinationHeaderContainer.swift
//  TravelDiscovery
//
//  Created by omar thamri on 8/12/2022.
//

import SwiftUI

struct DestinationHeaderContainer: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let pvc = CustomPageViewController()
        return pvc
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    
    typealias UIViewControllerType = UIViewController
    
    
}

class CustomPageViewController: UIPageViewController,UIPageViewControllerDataSource,UIPageViewControllerDelegate {
    
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
    
    let firstViewController = UIHostingController(rootView: Text("First View Controller"))
    let secondViewController = UIHostingController(rootView: Text("Second View Controller"))
    let thirdViewController = UIHostingController(rootView: Text("Third view controller"))
    lazy var allControllers: [UIViewController] = [
        firstViewController,secondViewController,thirdViewController
    ]
    
    init() {
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray5
        UIPageControl.appearance().currentPageIndicatorTintColor = .purple
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        setViewControllers([firstViewController], direction: .forward, animated: true )
        self.dataSource = self
        self.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct DestinationHeaderContainer_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PopularDestinationDetailView(destination: Destination(name: "Paris", country: "france", imageName: "paris", latitude: 48.875002, longitude: 2.355103))
        }
        DestinationHeaderContainer()
    }
}
