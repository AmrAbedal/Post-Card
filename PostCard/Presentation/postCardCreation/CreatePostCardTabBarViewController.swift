//
//  CreatePostCardTabBarViewController.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/4/21.
//

import UIKit

class CreatePostCardTabBarViewController: UITabBarController {
    private let viewModel: CreatePostCardViewModel
    init(viewModel: CreatePostCardViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.viewModel.setupTapBar()
        }
    }
    
    
    func setUpViewController(_ title: String, backgroundColor: UIColor) -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = backgroundColor
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(named: "star")
        return vc
    }
}
