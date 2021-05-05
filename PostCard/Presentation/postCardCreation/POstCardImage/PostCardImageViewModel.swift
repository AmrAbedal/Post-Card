//
//  PostCardImageViewModel.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/5/21.
//

import Foundation
import UIKit

protocol PostCardImageDelegate: AnyObject {
    func didChhoseImage(image: UIImage)
}

class PostCardImageViewModel {
    private weak var delegate: PostCardImageDelegate?
    private let coordinator: PostCardImageCoordinator
    init(coordinator: PostCardImageCoordinator, delegate: PostCardImageDelegate?) {
        self.coordinator = coordinator
        self.delegate = delegate
    }
    func didselctImage(image: UIImage ) {
        delegate?.didChhoseImage(image: image)
    }
}
