//
//  PostCardMainViewController.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/4/21.
//

import UIKit

class PostCardMainViewController: UIViewController {
    private let viewModel: PostCardMainViewModel
    init(viewModel: PostCardMainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "PostCardMainViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
