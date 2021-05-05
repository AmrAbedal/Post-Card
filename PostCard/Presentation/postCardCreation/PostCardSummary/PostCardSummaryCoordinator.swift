//
//  PostCardSummaryCoordinator.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/5/21.
//

import Foundation
import UIKit

class PostCardSummaryCoordinator {
    weak var tabBarController: UITabBarController?
    private weak var dataSource: PostCardSummaryViewControllerDataSourceAndDelegate?
    init(tabBarController: UITabBarController, delegate: PostCardSummaryViewControllerDataSourceAndDelegate?) {
        self.tabBarController = tabBarController
        self.dataSource = delegate
    }
    func start() {
        let viewModel = PostCardSummaryViewModel.init( coordinator: self)
        let vc = PostCardSummaryViewController.init(viewModel: viewModel)
        vc.dataSource = dataSource
        vc.delegate = dataSource
        vc.tabBarItem.title = "Summary"
        self.tabBarController?.addChild(vc)
    }
}
