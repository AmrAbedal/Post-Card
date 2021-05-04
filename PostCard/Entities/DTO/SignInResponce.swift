//
//  SignInResponce.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/4/21.
//

import Foundation

struct SignInResponce: Codable {
    let success: Bool
    let errormessage: String
    let errortitle: String
    let errorcode: String
}
