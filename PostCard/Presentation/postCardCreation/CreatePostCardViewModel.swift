//
//  CreatePostCardViewModel.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/4/21.
//

import Foundation
import UIKit
import RxSwift


class CreatePostCardViewModel {
    private let diposable = DisposeBag()
    private var style: PostCardStyle?
    private var image: UIImage?
    private var frontText: String?
    private var backText: String?
    private let coordinator: CreatePostCardCoordinator
    private let usecase: SavePostCardUseCase
    init(coordinator: CreatePostCardCoordinator, usecase: SavePostCardUseCase) {
        self.coordinator = coordinator
        self.usecase = usecase
    }
    
    func setupTapBar(tabBarController: UITabBarController) {
        coordinator.setupTapBar(tabBarController: tabBarController, delegate: self)
    }
}

extension CreatePostCardViewModel: CreatePostCardDelegate {
    func saveButtonTapped() {
        // save to Realm
        guard let frontText = frontText, let image = image, let style = style else {
            return
        }
        let card = PostCard.init()
        card.frontText = frontText
        card.backText = backText ?? ""
        card.type = style.title
        usecase.saveCard(image: image, card: card).subscribe(onSuccess: {result in
            self.handleSaveStatus(status: result)
        }, onError: {error in
            self.coordinator.showErrorToast()

        })
        .disposed(by: diposable)
    }
    private func handleSaveStatus(status: Result<String,Error>) {
        switch status {
        case .success:
            coordinator.cardSaved()
        case .failure: coordinator.showErrorToast()
        }
    }
    func postCardDiscription() -> String {
        return style?.title ?? ""
    }
    
    func postCardStyle() -> PostCardStyle {
        return style ?? .regular
    }
    
    func postCardFrontText() -> String {
        return frontText ?? ""
    }
    
    func postCardBackText() -> String {
        return backText ?? ""
    }
    
    func postCardImage() -> UIImage {
        return image ?? UIImage()
    }
    
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
