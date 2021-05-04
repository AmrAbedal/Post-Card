//
//  SiginInDataSourceImplementation.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/4/21.
//

import Foundation
import RxSwift
import Moya



class SiginInDataSourceImplementation: SignInDataSource {
    let moyaProvider = MoyaProvider<LoginEndPoint>()
    
    func signin(email: String, password: String) -> Single<SignInResponce> {
        return moyaProvider
            .rx.request(LoginEndPoint(email: email, password: password))
            .map({
                try JSONDecoder().decode(SignInResponce.self, from: $0.data)
            })
    }
}
