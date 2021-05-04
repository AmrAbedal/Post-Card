//
//  PosCardLoginViewController.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/4/21.
//

import UIKit

class PostCardLoginViewController: UIViewController {
    private let viewModel: PostCardLoginViewModel
    init(viewModel: PostCardLoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "PostCardLoginViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK:- IBOUTLETS
   
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signInButtonTapped(_ sender: UIButton) {
        viewModel.signInButtonTapped(email: emailTextField.text, password: passwordTextField.text)
    }
    
}
