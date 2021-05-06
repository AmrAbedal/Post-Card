//
//  CardOptionAlert.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/6/21.
//

import Foundation
import UIKit

protocol CardOptionAlertDelegate: AnyObject {
    func loadCard(card: PostCard)
    func sync(card: PostCard)
    func deleteCard(card: PostCard)
}

class CardOptionAlert: UIAlertController {
    weak var delegate: CardOptionAlertDelegate?
    private let card: PostCard
    init(card: PostCard ) {

        self.card = card
        super.init(nibName: nil, bundle: nil)

        title = "Options"
        let loadCardAction = UIAlertAction(title: "Load a card", style: .default){
            UIAlertAction in
            self.delegate?.loadCard(card: card)
        }
        let syncCardAction = UIAlertAction(title: "Sync", style: .default){
            UIAlertAction in
            self.delegate?.sync(card: card)
        }
        let deleteCardAction = UIAlertAction(title: "Delete", style: .default){
            UIAlertAction in
            self.delegate?.deleteCard(card: card)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){
            UIAlertAction in
        }
        addAction(loadCardAction)
        addAction(syncCardAction)
        addAction(deleteCardAction)
        addAction(cancelAction)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
