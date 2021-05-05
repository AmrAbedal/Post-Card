//
//  ArchivesCoordinator.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/6/21.
//

import Foundation
import UIKit

class ArchivesCoordinator {
    private let presentingViewController: UIViewController
    init(presentingViewController: UIViewController) {
        self.presentingViewController = presentingViewController
    }
    func start() {
        let viewModel = ArchivesViewModel.init(coordinator: self)
        let tabBarController = ArchivesTableViewController.init(viewModel: viewModel)
        self.presentingViewController.present(tabBarController, animated: true, completion: nil)
    }
}
