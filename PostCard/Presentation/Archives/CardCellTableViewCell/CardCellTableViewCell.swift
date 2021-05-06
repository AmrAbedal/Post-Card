//
//  CardCellTableViewCell.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/6/21.
//

import UIKit
struct CardCellViewModel {
    let image: UIImage?
    let frontText: String
    let typeText: String
    let backText: String
    init(card: PostCard?) {
        image  = DataBaseManager.shared.loadImageFromDiskWith(fileName: card?.image ?? "")
        frontText = "Front Text: \( card?.frontText ?? "")"
        backText = "Back Text: \(card?.backText ?? "")"
        typeText = "Type: \(PostCardStyle(rawValue: card?.type ?? "")?.title ?? PostCardStyle.regular.title)"
    }
}

class CardCellTableViewCell: UITableViewCell {
    static let nibName: String = "CardCellTableViewCell"
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var frontLbel: UILabel!
    @IBOutlet weak var backTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(card: CardCellViewModel) {
        cardImage.image = card.image
        typeLabel.text = card.typeText
        frontLbel.text = card.frontText
        backTextLabel.text = card.backText
    }
}
