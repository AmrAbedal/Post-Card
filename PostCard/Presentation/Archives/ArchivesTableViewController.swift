//
//  ArchivesTableViewController.swift
//  PostCard
//
//  Created by Amr AbdelWahab on 5/6/21.
//

import UIKit
import RealmSwift
import RxSwift

class ArchivesTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var styleSegment: UISegmentedControl!
    private let disposable = DisposeBag()
    private let viewModel: ArchivesViewModel
    private var archives: Results<PostCard>?
    private var filteredArchives: Results<PostCard>? {
        let title = viewModel.styles[styleSegment.selectedSegmentIndex].title
        return archives?.filter(NSPredicate(format: "type = '\(title)'"))
    }
    init(viewModel: ArchivesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "ArchivesTableViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addSegmentedControll()
        registerCell()
        setupSubscribers()
        viewModel.viewDidLoad()
    }
    private func addSegmentedControll() {
        styleSegment.removeAllSegments()
        for (index, style) in viewModel.styles.enumerated() {
            styleSegment.insertSegment(withTitle: style.title, at: index, animated: true) }
        styleSegment.selectedSegmentIndex = 0
    }
    private func registerCell() {
        tableView.rowHeight = 210
        tableView.dataSource = self
        tableView.delegate = self
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
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    
    private func handleArchives(state: Result<Results<PostCard>, Error>) {
        switch state {
        case .success(let archives):
            self.archives = archives
            tableView.reloadData()
        case .failure: break
            
        }
    }
}

extension ArchivesTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArchives?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:CardCellTableViewCell.nibName, for: indexPath) as? CardCellTableViewCell else { return UITableViewCell() }
        cell.configure(card:  CardCellViewModel.init(card: self.filteredArchives?[indexPath.row]))
        
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let card = filteredArchives?[indexPath.row]  else {
            return
        }
        viewModel.didSelectCard(card: card)
    }
}
