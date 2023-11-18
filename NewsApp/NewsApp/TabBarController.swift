//
//  TabBarController.swift
//  NewsApp
//
//  Created by Artem Doloban on 23.10.2023.
//


import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.tintColor = .black
        setupViewControllers()
        
    }
    
    private func setupViewControllers() {
        viewControllers = [
            setupNavigationController(rootViewController: GeneralViewController(viewModel: GeneralViewModel()), title: "General", image: UIImage(systemName: "newspaper") ?? UIImage.add),
            
            setupNavigationController(rootViewController: TechnologyViewController(), title: "Technology", image: UIImage(systemName: "gyroscope") ?? UIImage.add),
            
            setupNavigationController(rootViewController: BusinessViewController(viewModel: BusinessViewModel()), title: "Business", image: UIImage(systemName: "briefcase") ?? UIImage.add)
            
        ]
        setupTapBar()
    }
    
    private func setupNavigationController(rootViewController: UIViewController,
                                           title: String,
                                           image: UIImage) -> UINavigationController {
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        rootViewController.navigationItem.title = title
        navigationController.navigationBar.prefersLargeTitles = true
        
        return navigationController
    }
    
    private func setupTapBar() {
        let apperance = UITabBarAppearance()
        apperance.configureWithOpaqueBackground()
        tabBar.scrollEdgeAppearance = apperance
        
        view.tintColor = .black
    }
}
