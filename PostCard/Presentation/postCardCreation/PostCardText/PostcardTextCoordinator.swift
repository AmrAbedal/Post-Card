//
//  PostcardTextCoordinator.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/5/21.
//

import Foundation
import UIKit
class PostcardTextCoordinator {
    weak var tabBarController: UITabBarController?
    private weak var delegate: PostcardTextDelegate?
    private weak var dataSource: PostcardTextDataSource?
    init(tabBarController: UITabBarController, delegate: PostcardTextDelegate?,  dataSource: PostcardTextDataSource?) {
        self.tabBarController = tabBarController
        self.delegate = delegate
        self.dataSource = dataSource
    }
    func start() {
        let viewModel = PostcardTextViewModel.init(coordinator: self)
        viewModel.delegate = delegate
        viewModel.dataSource = dataSource
        let vc = PostcardTextViewContoller.init(viewModel: viewModel)
        vc.tabBarItem.title = "Text"
        self.tabBarController?.addChild(vc)
    }
}
