//
//  PostCardLoginViewModel.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/4/21.
//

import Foundation
import RxSwift

class PostCardLoginViewModel {
    private let disposeBage = DisposeBag()
    private let coordinator: PostCardLoginCoordinator
    private let loginUseCase: LoginUseCase
    init(coordinator: PostCardLoginCoordinator, loginUseCase: LoginUseCase) {
        self.coordinator = coordinator
        self.loginUseCase = loginUseCase
    }
    
    func signInButtonTapped() {
        loginUseCase.login(email: "String", password: "String")
            .subscribe(onSuccess: {[weak self] leagueScreenData in
                self?.handleResult()
            }, onError: { [weak self] error in
                self?.handleError()
            }).disposed(by: disposeBage)
    }
    private func handleResult() {
        coordinator.navigateToMainScreen()
    }
    private func handleError() {
        
    }
}
