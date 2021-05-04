//
//  LoginUseCaseImplementation.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/4/21.
//

import Foundation
import RxSwift
class LoginUseCaseImplementation: LoginUseCase {
    func login(email: String, password: String) -> Single<Result<SignInViewModel, Error>> {
        return .just(.success(SignInViewModel.init(name: "Amr")))
    }
}
