//
//  Contracts.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/5/21.
//

import Foundation
import UIKit
protocol PostcardTextDataSource: AnyObject {
    func isFoldable() -> Bool
}

protocol PostcardTextDelegate: AnyObject {
    func frontAndBackTextChanged(frontText: String, backText: String)
}

protocol PostCardPerviewViewControllerDataSource: AnyObject {
    func postCardStyle() -> PostCardStyle
    func postCardFrontText() -> String
    func postCardBackText() -> String
    func postCardImage() -> UIImage
}

protocol PostCardStyleDelegate: AnyObject {
    func didSelect(style: PostCardStyle)
}

protocol PostCardImageDelegate: AnyObject {
    func didChhoseImage(image: UIImage)
}

protocol PostCardSummaryViewControllerDelegate: AnyObject {
    func saveButtonTapped()
}

protocol PostCardSummaryViewControllerDataSource: AnyObject {
    func postCardDiscription() -> String
}

protocol PostCardSummaryViewControllerDataSourceAndDelegate:  PostCardSummaryViewControllerDelegate, PostCardSummaryViewControllerDataSource {}


protocol CreatePostCardDelegate: PostCardStyleDelegate, PostCardImageDelegate, PostcardTextDelegate, PostcardTextDataSource, PostCardPerviewViewControllerDataSource, PostCardSummaryViewControllerDataSourceAndDelegate {}
