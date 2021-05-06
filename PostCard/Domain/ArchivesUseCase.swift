//
//  ArchivesUseCase.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/6/21.
//

import Foundation
import RxSwift
import RealmSwift

protocol ArchivesUseCase {
    func loadArchives() -> Single<Result<Results<PostCard> ,Error>>
    func deleteCard(card: PostCard) -> Single<Result<String,Error>>
}

class ArchivesUseCaseImplementation: ArchivesUseCase {
    func deleteCard(card: PostCard) -> Single<Result<String, Error>> {
        do {
             try DataBaseManager.shared.deleteCard(card: card)
            return .just(.success("Deleted Successfully "))
        } catch {
            return .just(.failure(error))
        }
    }
    
  
    func loadArchives() -> Single<Result<Results<PostCard> ,Error>> {
        do {
            let archives = try DataBaseManager.shared.getPostCards().sorted(byKeyPath: "date",ascending: false)
            return .just(.success(archives))
        } catch {
            return .just(.failure(error))
        }
    }
}
