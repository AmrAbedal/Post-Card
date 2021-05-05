//
//  PostcardTextViewContoller.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/5/21.
//

import UIKit

class PostcardTextViewContoller: UIViewController {
    private lazy var frontTextFieldDelegate = FrontTextFieldDelegate()
    private lazy var backTextFieldDelegate = BackTextFieldDelegate()
    @IBOutlet weak var backTextLabel: UILabel!
    @IBOutlet weak var frontTextLabe: UILabel!
    @IBOutlet weak var backTextTextField: UITextField!
    @IBOutlet weak var frontTextTextField: UITextField!
    private let viewModel: PostcardTextViewModel
    init(viewModel: PostcardTextViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "PostcardTextViewContoller", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        backTextTextField.delegate = backTextFieldDelegate
        frontTextTextField.delegate = frontTextFieldDelegate

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupViews()
    }
    private func setupViews() {
        
        backTextLabel.isHidden = !viewModel.isFoldable
        backTextTextField.isHidden =  !viewModel.isFoldable
    }
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        viewModel.frontAndBackTextChanged(frontText: frontTextTextField.text, backText: backTextTextField.text)
    }
}
