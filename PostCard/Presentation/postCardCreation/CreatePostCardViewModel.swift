//
//  CreatePostCardViewModel.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/4/21.
//

import Foundation
import UIKit
class CreatePostCardViewModel {
    private var style: PostCardStyle?
    private let coordinator: CreatePostCardCoordinator
    init(coordinator: CreatePostCardCoordinator) {
        self.coordinator = coordinator
    }
    
    func setupTapBar(tabBarController: UITabBarController) {
        coordinator.setupTapBar(tabBarController: tabBarController, delegate: self)
    }
}

extension CreatePostCardViewModel: CreatePostCardDelegate {
    func didSelect(style: PostCardStyle) {
        self.style = style
    }
}
