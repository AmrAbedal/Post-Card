//
//  PostCardStyleViewController.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/5/21.
//

import UIKit

class PostCardStyleViewController: UIViewController {
    @IBOutlet weak var styleSegment: UISegmentedControl!

    private let viewmodel: PostCardStyleViewModel
    init(viewmodel: PostCardStyleViewModel) {
        self.viewmodel = viewmodel
        super.init(nibName: "PostCardStyleViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleSegment.removeAllSegments()
        for (index, style) in viewmodel.styles.enumerated() {
            styleSegment.insertSegment(withTitle: style.title, at: index, animated: true) }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func styleValueChanged(_ sender: UISegmentedControl) {
        viewmodel.didSelectPostCardStyle(index: sender.selectedSegmentIndex)
    }
}
