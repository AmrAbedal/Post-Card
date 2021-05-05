//
//  PostCardStyleViewModel.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/5/21.
//

import Foundation

enum PostCardStyle {
    case regular, foldable
    var title: String {
        switch self {
        case .regular:
            return "regular"
        case .foldable:
           return "foldable"
        }
    }
}

protocol PostCardStyleDelegate: AnyObject {
    func didSelect(style: PostCardStyle)
}
protocol CreatePostCardDelegate: PostCardStyleDelegate, PostCardImageDelegate {}

class PostCardStyleViewModel {
   let styles: [PostCardStyle]
   private let coordinator: PostCardStyleCoordinator
   private weak var delegate: PostCardStyleDelegate?
    init(styles: [PostCardStyle], coordinator: PostCardStyleCoordinator, delegate: PostCardStyleDelegate?) {
        self.styles = styles
        self.coordinator = coordinator
        self.delegate = delegate
    }
    func didSelectPostCardStyle(index: Int) {
        delegate?.didSelect(style: self.styles[index])
    }
}
