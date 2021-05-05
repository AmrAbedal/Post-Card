//
//  PostCardMainViewModel.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/4/21.
//

import Foundation
import RxSwift

class PostCardMainViewModel {
    private let dispsoable = DisposeBag()
    let ArchiveCountSubject = BehaviorSubject<Result<Int,Error>?>(value: nil)
    private let coordinator: PostCardMainCoordinator
    private let archivesCountUseCase: ArchivesCountUseCase
    init(coordinator: PostCardMainCoordinator, archivesCountUseCase: ArchivesCountUseCase) {
        self.coordinator = coordinator
        self.archivesCountUseCase = archivesCountUseCase
    }
    func viewDidLoad() {
        archivesCountUseCase.archivesCount()
            .subscribe(onSuccess: {
                result in
                self.ArchiveCountSubject.onNext(result)
            }, onError: {error in
                self.ArchiveCountSubject.onNext(.failure(error))
            }).disposed(by: dispsoable)
    }
    func createCardButtonTapped() {
        coordinator.openCreateCard()
    }
    func openArchiveButtonTapped() {
        coordinator.openArchives()
    }
}
