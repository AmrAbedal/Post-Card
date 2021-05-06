//
//  SavePostCardUseCase.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/6/21.
//

import Foundation


import Foundation
import RxSwift
import RealmSwift
import UIKit

protocol SavePostCardUseCase {
    func saveCard(image: UIImage, card: PostCard) -> Single<Result<String ,Error>>
}

class SavePostCardUseCaseImplementation: SavePostCardUseCase {
    func saveCard(image: UIImage, card: PostCard) -> Single<Result<String ,Error>> {
        do {
            card.image = try DataBaseManager.shared.saveImage(image: image)
             try DataBaseManager.shared.saveCard(card: card)
            return .just(.success("Saved"))
        } catch {
            return .just(.failure(error))
        }
    }
}
