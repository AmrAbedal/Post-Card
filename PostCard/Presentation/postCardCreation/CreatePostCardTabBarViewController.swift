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
        
        // Do any additional setup after loading the view.
        let vc1 = setUpViewController("First", backgroundColor: UIColor.orange)
        let vc2 = setUpViewController("Second", backgroundColor: UIColor.purple)
        let vc3 = setUpViewController("Third", backgroundColor: UIColor.red)
        let vc4 = setUpViewController("Fourth", backgroundColor: UIColor.green)
        let vc5 = setUpViewController("Fifth", backgroundColor: UIColor.blue)
        
        // Set up the Tab Bar Controller
        viewControllers = [vc1, vc2, vc3, vc4, vc5]    }
    
    func setUpViewController(_ title: String, backgroundColor: UIColor) -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = backgroundColor
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(named: "star")
        return vc
    }
}
