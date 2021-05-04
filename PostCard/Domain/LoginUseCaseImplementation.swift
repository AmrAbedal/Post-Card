//
//  LoginUseCaseImplementation.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/4/21.
//

import Foundation
import RxSwift
struct AppError: Error {
    
}
class LoginUseCaseImplementation: LoginUseCase {
    func login(email: String, password: String, dataSource: SignInDataSource) -> Single<Result<SignInViewModel, Error>> {
        return dataSource.signin(email: email, password: password)
            .map({
                if $0.success {
                    return .success(SignInViewModel(name: "Amr"))
                } else {
                    return .success(SignInViewModel(name: "Amr"))
                }
            })
    }
}
