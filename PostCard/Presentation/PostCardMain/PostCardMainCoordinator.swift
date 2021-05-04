//
//  PostCardMainCoordinator.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/4/21.
//

import Foundation
import UIKit

class PostCardMainCoordinator {
   private let navigationContoller: UINavigationController
    init(navigationContoller: UINavigationController) {
        self.navigationContoller = navigationContoller
    }
    func start() {
        let viewmodel = PostCardMainViewModel(coordinator: self)
        let vc = PostCardMainViewController(viewModel: viewmodel)
        navigationContoller.pushViewController(vc, animated: true)
    }
}
