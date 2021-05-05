//
//  PostCardPerviewViewController.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/5/21.
//

import UIKit

class PostCardPerviewViewController: UIViewController {
    weak var dataSource: PostCardPerviewViewControllerDataSource?
    @IBOutlet weak var frontTextLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    private let viewModel: PostCardPerviewViewModel
    init(viewModel: PostCardPerviewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "PostCardPerviewViewController", bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
    }
    func reloadData() {
        imageView.image = dataSource?.postCardImage()
        frontTextLabel.text = dataSource?.postCardFrontText()
    }

}
