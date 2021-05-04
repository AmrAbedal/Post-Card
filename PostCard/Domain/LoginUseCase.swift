//
//  LoginUseCase.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/4/21.
//

import Foundation
import RxSwift

protocol LoginUseCase {
    func login(email: String,password: String,dataSource: SignInDataSource) -> Single<Result<SignInViewModel,Error>>
}
