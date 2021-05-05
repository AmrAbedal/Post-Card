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

protocol SavePostCardUseCase {
    func saveCard(card: PostCard) -> Single<Result<String ,Error>>
}

class SavePostCardUseCaseImplementation: SavePostCardUseCase {
    func saveCard(card: PostCard) -> Single<Result<String ,Error>> {
        do {
             try DataBaseManager.shared.saveCard(card: card)
            return .just(.success("Saved"))
        } catch {
            return .just(.failure(error))
        }
    }
}
