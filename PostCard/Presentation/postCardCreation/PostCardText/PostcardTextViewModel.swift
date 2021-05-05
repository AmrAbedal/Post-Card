//
//  PostcardTextViewModel.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/5/21.
//

import Foundation

class PostcardTextViewModel {
    weak var delegate: PostcardTextDelegate?
    weak var dataSource: PostcardTextDataSource?
    private let coordinator: PostcardTextCoordinator
    init(coordinator: PostcardTextCoordinator) {
        self.coordinator = coordinator
    }
    func frontAndBackTextChanged(frontText: String?, backText: String?) {
        delegate?.frontAndBackTextChanged(frontText: frontText ?? "", backText: backText ?? "")
    }
    var isFoldable: Bool {
        return dataSource?.isFoldable() ?? false
    }
}
