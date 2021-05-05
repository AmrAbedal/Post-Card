//
//  PostCardSummaryViewController.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/5/21.
//

import UIKit

protocol PostCardSummaryViewControllerDelegate: AnyObject {
    func saveButtonTapped()
}
protocol PostCardSummaryViewControllerDataSource: AnyObject {
    func postCardDiscription() -> String
}
protocol PostCardSummaryViewControllerDataSourceAndDelegate:  PostCardSummaryViewControllerDelegate, PostCardSummaryViewControllerDataSource {}

class PostCardSummaryViewController: UIViewController {
    
    
    @IBOutlet weak var saveButtontapped: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    weak var dataSource: PostCardSummaryViewControllerDataSource?
    weak var delegate: PostCardSummaryViewControllerDelegate?
    private let viewModel:  PostCardSummaryViewModel
    init( viewModel:  PostCardSummaryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "PostCardSummaryViewController", bundle: nil)
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
        descriptionLabel.text = dataSource?.postCardDiscription()
    }
    
    @IBAction func saveButtonDidTapped(_ sender: UIButton) {
        delegate?.saveButtonTapped()
    }
    
}
