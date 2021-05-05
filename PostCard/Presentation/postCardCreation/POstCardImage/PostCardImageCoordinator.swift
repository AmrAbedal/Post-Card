//
//  PostCardImageCoordinator.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/5/21.
//

import Foundation
import UIKit

class PostCardImageCoordinator {
    weak var tabBarController: UITabBarController?
    private weak var delegate: PostCardImageDelegate?
    init(tabBarController: UITabBarController, delegate: PostCardImageDelegate?) {
        self.tabBarController = tabBarController
        self.delegate = delegate
    }
    func start() {
        let viewModel = PostCardImageViewModel.init( coordinator: self, delegate: delegate)
        let vc = PostCardImageViewController.init(viewModel: viewModel)
        vc.tabBarItem.title = "image"
        self.tabBarController?.addChild(vc)
    }
}
