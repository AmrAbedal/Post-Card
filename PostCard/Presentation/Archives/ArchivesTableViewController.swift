//
//  ArchivesTableViewController.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/6/21.
//

import UIKit
import RealmSwift
import RxSwift

class ArchivesTableViewController: UITableViewController {
    private let disposable = DisposeBag()
    private let viewModel: ArchivesViewModel
    private var archives: Results<PostCard>?
    init(viewModel: ArchivesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "ArchivesTableViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setupSubscribers()
        viewModel.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    private func registerCell() {
        
        tableView.register(UINib.init(nibName: CardCellTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: CardCellTableViewCell.nibName)
    }
    private func setupSubscribers() {
        viewModel.archivesSubject
            .subscribe({[weak self] event in
                if let element = event.element, let state = element {
                    self?.handleArchives(state: state)
                }
            }).disposed(by: disposable)
    }
    private func handleArchives(state: Result<Results<PostCard>, Error>) {
        switch state {
        case .success(let archives):
            self.archives = archives
            tableView.reloadData()
        case .failure(let error): break
            
        }
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return archives?.count ?? 0
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:CardCellTableViewCell.nibName, for: indexPath) as? CardCellTableViewCell else { return UITableViewCell() }
        cell.configure(card:  CardCellViewModel.init(card: self.archives?[indexPath.row]))
     
     return cell
     }
     
   
    
}
