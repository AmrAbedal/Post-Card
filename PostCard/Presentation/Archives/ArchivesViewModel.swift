//
//  ArchivesViewModel.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/6/21.
//

import Foundation
import RxSwift
import RealmSwift

class ArchivesViewModel {
    private let diposeable = DisposeBag()
    var archivesSubject = BehaviorSubject<Result<Results<PostCard>,Error>?>(value: nil)
    private let usecase: ArchivesUseCase
    private let coordinator: ArchivesCoordinator
    init(coordinator: ArchivesCoordinator, usecase: ArchivesUseCase) {
        self.coordinator = coordinator
        self.usecase = usecase
    }
    func viewDidLoad() {
        usecase.loadArchives()
            .subscribe(onSuccess: {result in
                self.archivesSubject.onNext(result)
            }, onError: {error in
                self.archivesSubject.onError(error)
            })
            .disposed(by: diposeable)
    }
    
}
