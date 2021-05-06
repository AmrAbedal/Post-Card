//
//  ArchivesCountUseCase.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/6/21.
//

import Foundation
import RxSwift

protocol ArchivesCountUseCase {
    func archivesCount() -> Single<Result<Int,Error>>
}

class ArchivesCountUseCaseImplementation: ArchivesCountUseCase {
    func archivesCount() -> Single<Result<Int,Error>> {
        do {
            let count = try DataBaseManager.shared.getPostCards().count
            return .just(.success(count))
        } catch {
            return .just(.failure(error))
        }
    }
}
