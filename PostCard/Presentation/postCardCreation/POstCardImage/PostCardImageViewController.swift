//
//  PostCardImageViewController.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/5/21.
//

import UIKit

class PostCardImageViewController: UIViewController {
    private let viewModel: PostCardImageViewModel
    private lazy var imagePicker = UIImagePickerController()

    init(viewModel: PostCardImageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "PostCardImageViewController", bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @IBAction func chooseImage(_ sender: UIButton) {
        ImagePickerManager().pickImage(self){ image in
               //here is the image
            self.viewModel.didselctImage(image: image)
           }
           }
    
}

