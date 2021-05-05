//
//  PostCardMainViewController.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/4/21.
//

import UIKit
import RxSwift

class PostCardMainViewController: UIViewController {
    private let disposeBage = DisposeBag()
    private let viewModel: PostCardMainViewModel
    @IBOutlet weak var archivesButton: UIButton!
    init(viewModel: PostCardMainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "PostCardMainViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setSubscribers()
        viewModel.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    private func setSubscribers() {
        viewModel.ArchiveCountSubject
            .subscribe({[weak self ] event in
                if let element = event.element, let state = element {
                    self?.handleResult(result: state )
                }
            }).disposed(by: disposeBage)
    }
    private func handleResult(result: Result<Int, Error>)
    {
        switch result {
        case .success(let count):
            archivesButton.setTitle("Archives(\(count))", for: .normal)
        case .failure(let error): break
        }

    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        self.viewModel.createCardButtonTapped()
    }
    
    @IBAction func archivesButtonTapped(_ sender: Any) {
        self.viewModel.openArchiveButtonTapped()
    }
}
