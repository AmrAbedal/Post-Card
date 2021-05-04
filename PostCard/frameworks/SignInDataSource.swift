//
//  SignInDataSource.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/4/21.
//

import Foundation
import RxSwift

protocol SignInDataSource {
    func signin(email: String, password: String) -> Single<SignInResponce>
}
