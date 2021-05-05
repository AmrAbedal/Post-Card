//
//  PostCardViewCoordinator.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/5/21.
//

import Foundation
import UIKit

class PostCardViewCoordinator {
    weak var tabBarController: UITabBarController?
    private weak var dataSource: PostCardPerviewViewControllerDataSource?
    init(tabBarController: UITabBarController, delegate: PostCardPerviewViewControllerDataSource?) {
        self.tabBarController = tabBarController
        self.dataSource = delegate
    }
    func start() {
        let viewModel = PostCardPerviewViewModel.init( coordinator: self)
        let vc = PostCardPerviewViewController.init(viewModel: viewModel)
        vc.dataSource = dataSource
        vc.tabBarItem.title = "Preview"
        self.tabBarController?.addChild(vc)
    }
}
