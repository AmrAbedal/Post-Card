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
    private var image: UIImage?
    private var frontText: String?
    private var backText: String?
    private let coordinator: CreatePostCardCoordinator
    init(coordinator: CreatePostCardCoordinator) {
        self.coordinator = coordinator
    }
    
    func setupTapBar(tabBarController: UITabBarController) {
        coordinator.setupTapBar(tabBarController: tabBarController, delegate: self)
    }
}

extension CreatePostCardViewModel: CreatePostCardDelegate {
    func isFoldable() -> Bool {
        return  style == PostCardStyle.foldable 
    }
    
    func frontAndBackTextChanged(frontText: String, backText: String) {
        self.backText = backText
        self.frontText = frontText
    }
    
    func didChhoseImage(image: UIImage) {
        self.image = image
    }
    
    func didSelect(style: PostCardStyle) {
        self.style = style
    }
}
