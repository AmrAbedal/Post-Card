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
}
