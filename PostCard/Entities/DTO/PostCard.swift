//
//  PostCard.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/5/21.
//

import Foundation
import RealmSwift

class PostCard: Object {
    @objc dynamic var _id: String = UUID().uuidString
    @objc dynamic var date = Date()
    @objc dynamic var frontText: String = ""
    @objc dynamic var backText: String = ""
    @objc dynamic var image: String = ""
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
    func deleteCard(card: PostCard) throws {
        guard let realm = realm else {
            throw AppError.init()
        }
        do {
            try realm.write({
                realm.delete(card)
            })
        } catch{
            throw AppError.init()
            
        }
    }
    func saveImage( image: UIImage) throws ->  String  {
        
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            throw AppError()
        }
        
        let fileName = UUID().uuidString
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        guard let data = image.jpegData(compressionQuality: 1) else {
            throw AppError()
        }
        do {
            try data.write(to: fileURL)
            return fileName
        } catch  {
            throw AppError()
        }
    }
    
    func loadImageFromDiskWith(fileName: String) -> UIImage? {
        
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        
        if let dirPath = paths.first {
            let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
            let image = UIImage(contentsOfFile: imageUrl.path)
            return image
            
        }
        return nil
    }
}



