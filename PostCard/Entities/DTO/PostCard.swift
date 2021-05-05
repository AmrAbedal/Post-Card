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
    var image: NSData? = nil
    @objc dynamic var type: String = ""
    
    override static func primaryKey() -> String? {
        return "_id"
    }
}

class DataBaseManager {
    let realm: Realm
    static let shared: DataBaseManager = DataBaseManager()
    init() {
        self.realm = try! Realm.init()
    }
    func getPostCards() -> Results<PostCard> {
        return realm.objects(PostCard.self)
    }
    func saveCard(card: PostCard) {
        try! realm.write({
            realm.add(card)
        })
    }
}
