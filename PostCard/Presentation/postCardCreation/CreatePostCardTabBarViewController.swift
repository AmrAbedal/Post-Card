//
//  CreatePostCardTabBarViewController.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/4/21.
//

import UIKit

class CreatePostCardTabBarViewController: UITabBarController {
    deinit {
        print("CreatePostCardTabBarViewController deaalocated ")
    }
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
        self.viewModel.setupTapBar(tabBarController: self)
        
    }
    func setUpViewController(_ title: String, backgroundColor: UIColor) -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = backgroundColor
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(named: "star")
        return vc
    }
}
