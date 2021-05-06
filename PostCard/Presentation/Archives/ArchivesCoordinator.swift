//
//  ArchivesCoordinator.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/6/21.
//

import Foundation
import UIKit

class ArchivesCoordinator {
    private let navigationVontroller: UINavigationController
    init(navigationVontroller: UINavigationController) {
        self.navigationVontroller = navigationVontroller
    }
    func start() {
        let viewModel = ArchivesViewModel.init(coordinator: self, usecase: ArchivesUseCaseImplementation(), styles: [.foldable, .regular])
        let archivesVC = ArchivesTableViewController.init(viewModel: viewModel)
        self.navigationVontroller.pushViewController(archivesVC, animated: true)
    }
    func showCardOption(card: PostCard) {
        let alert = UIAlertController(title: "Options", message: nil, preferredStyle: .actionSheet)

        let loadCardAction = UIAlertAction(title: "Load a card", style: .default){
            UIAlertAction in
            self.loadCard(card: card)
        }
        let syncCardAction = UIAlertAction(title: "Sync", style: .default){
            UIAlertAction in
            self.sync(card: card)
        }
        let deleteCardAction = UIAlertAction(title: "Delete", style: .default){
            UIAlertAction in
            self.deleteCard(card: card)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){
            UIAlertAction in
        }
        alert.addAction(loadCardAction)
        alert.addAction(syncCardAction)
        alert.addAction(deleteCardAction)
        alert.addAction(cancelAction)
        navigationVontroller.present(alert, animated: true, completion: nil)
        
    }
    func loadCard(card: PostCard) {
        
    }
    func sync(card: PostCard) {
        
    }
    func deleteCard(card: PostCard) {
        
    }
}
