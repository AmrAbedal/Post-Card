//
//  CreatePostCardCoordinator.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/4/21.
//

import Foundation
import UIKit

class CreatePostCardCoordinator {
   private let presentingViewController: UIViewController
    init(presentingViewController: UIViewController) {
        self.presentingViewController = presentingViewController
    }
    func start() {
        let viewModel = CreatePostCardViewModel.init(coordinator: self)
        let tabBarController = CreatePostCardTabBarViewController.init(viewModel: viewModel)
        self.presentingViewController.present(tabBarController, animated: true, completion: nil)
    }
    func setupTapBar(tabBarController: UITabBarController, delegate: CreatePostCardDelegate) {
        PostCardStyleCoordinator.init(tabBarController: tabBarController, delegate: delegate).start()
        
    }
}
