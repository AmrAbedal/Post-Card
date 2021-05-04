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
    private let dataSource: SignInDataSource
    init(coordinator: PostCardLoginCoordinator, loginUseCase: LoginUseCase, dataSource: SignInDataSource) {
        self.coordinator = coordinator
        self.loginUseCase = loginUseCase
        self.dataSource = dataSource
    }
    
    func signInButtonTapped(email: String?, password: String?) {
        loginUseCase.login(email: email ?? "", password: password ?? "", dataSource: dataSource)
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
