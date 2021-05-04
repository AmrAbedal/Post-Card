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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
