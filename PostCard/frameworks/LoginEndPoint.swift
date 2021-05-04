//
//  LoginEndPoint.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/4/21.
//

import Foundation
import Moya

struct LoginEndPoint: TargetType {
    let email: String
    let password: String
    var baseURL: URL { return URL.init(string: "https://www.mypostcard.com/mobile/login.php?json=1")! }
    
    var path: String { return ""}
    
    var method: Moya.Method { return .post }
    
    var sampleData: Data { return Data() }
    
    var task: Task {
        return Task.requestParameters(parameters: ["email":email,"password":password], encoding: JSONEncoding.default)
        
    }
    
    var headers: [String : String]? { return nil }
}
