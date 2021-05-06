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
    let styles: [PostCardStyle]
    private let diposeable = DisposeBag()
    var archivesSubject = BehaviorSubject<Result<Results<PostCard>,Error>?>(value: nil)
    private let archivesUseCase: ArchivesUseCase
    private let coordinator: ArchivesCoordinator
    init(coordinator: ArchivesCoordinator, usecase: ArchivesUseCase, styles: [PostCardStyle]) {
        self.coordinator = coordinator
        self.archivesUseCase = usecase
        self.styles = styles
    }
    func viewDidLoad() {
        archivesUseCase.loadArchives()
            .subscribe(onSuccess: {result in
                self.archivesSubject.onNext(result)
            }, onError: {error in
                self.archivesSubject.onError(error)
            })
            .disposed(by: diposeable)
    }
    func didSelectCard(card: PostCard) {
        coordinator.showCardOption(card: card, delegate: self)
    }
    
}
extension ArchivesViewModel: CardOptionAlertDelegate {
    func loadCard(card: PostCard) {
       
    }
  
    private func handleError() {
        
    }
    
    func sync(card: PostCard) {
        
    }
    
    func deleteCard(card: PostCard) {
        archivesUseCase.deleteCard(card: card)
            .subscribe(onSuccess: {result in
                self.handleDeleteStatus(status: result)
            }, onError: {error in
                self.handleError()
            })
            .disposed(by: diposeable)
    }
    private func handleDeleteStatus(status: Result<String,Error>) {
        switch status {
        case .success(_): viewDidLoad()
            
        case .failure(_): break
        // handle Error
        }
    }
    
}
