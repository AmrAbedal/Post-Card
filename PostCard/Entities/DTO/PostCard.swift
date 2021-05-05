//
//  PostCard.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/5/21.
//

import Foundation
import RealmSwift

class PostCard: Object {
    @objc dynamic var _id: String = ""
    @objc dynamic var date = Date()
    @objc dynamic var frontText: String = ""
    @objc dynamic var backText: String = ""
    var image: Data? = nil
    @objc dynamic var type: String = ""
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}

class DataBaseManager {
    let realm: Realm?
    static let shared: DataBaseManager = DataBaseManager()
    init() {
        self.realm = try? Realm.init()
    }
    func getPostCards() throws ->  Results<PostCard>  {
        guard let realm = realm else {
            throw AppError.init()
        }
        return realm.objects(PostCard.self)
    }
    func saveCard(card: PostCard) throws {
        guard let realm = realm else {
            throw AppError.init()
        }
        do {
            try realm.write({
                realm.add(card)
            })
        } catch{
            throw AppError.init()
            
        }
        
    }
}


