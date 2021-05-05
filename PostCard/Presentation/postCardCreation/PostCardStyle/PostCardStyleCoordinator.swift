//
//  PostCardStyleViewModelCoordinator.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/5/21.
//

import Foundation
import UIKit
class PostCardStyleCoordinator {
    let tabBarController: UITabBarController
    private weak var delegate: PostCardStyleDelegate?
    init(tabBarController: UITabBarController, delegate: PostCardStyleDelegate?) {
        self.tabBarController = tabBarController
        self.delegate = delegate
    }
    func start() {
        let viewModel = PostCardStyleViewModel.init(styles: [.foldable,.regular], coordinator: self, delegate: delegate)
        let vc = PostCardStyleViewController.init(viewmodel: viewModel)
        vc.tabBarItem.title = "Style"
        self.tabBarController.addChild(vc1)
    }
}
