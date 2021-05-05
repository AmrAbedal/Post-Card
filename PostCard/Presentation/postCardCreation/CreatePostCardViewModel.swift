//
//  CreatePostCardViewModel.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/4/21.
//

import Foundation

class CreatePostCardViewModel {
    private let coordinator: CreatePostCardCoordinator
    init(coordinator: CreatePostCardCoordinator) {
        self.coordinator = coordinator
    }
    
    func setupTapBar() {
        coordinator.setupTapBar(delegate: self)
    }
}

extension CreatePostCardViewModel: CreatePostCardDelegate {
    func didSelect(style: PostCardStyle) {
        
    }
}
