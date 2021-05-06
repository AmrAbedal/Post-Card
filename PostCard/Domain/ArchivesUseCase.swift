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
}

class ArchivesUseCaseImplementation: ArchivesUseCase {
    func loadArchives() -> Single<Result<Results<PostCard> ,Error>> {
        do {
            let archives = try DataBaseManager.shared.getPostCards().sorted(byKeyPath: "date",ascending: false)
            return .just(.success(archives))
        } catch {
            return .just(.failure(error))
        }
    }
}
