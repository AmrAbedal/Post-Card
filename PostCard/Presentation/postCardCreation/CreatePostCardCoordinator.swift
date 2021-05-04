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
        let vc = CreatePostCardTabBarViewController.init(viewModel: viewModel)
        self.presentingViewController.present(vc, animated: true, completion: nil)
    }
}
