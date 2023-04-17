//
//  FeedViewController.swift
//  Marslink_Swift5
//
//  Created by liuruixuan on 2023/4/17.
//

import IGListDiffKit
import IGListKit
import UIKit

class FeedViewController: UIViewController {
    let loader = JournalEntryLoader()
    let collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = UIColor.black
        return view
    }()

    lazy var adapter: ListAdapter = {
        ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()

    let pathfinder = Pathfinder()
    let wxScanner = WxScanner()

    override func viewDidLoad() {
        super.viewDidLoad()

        loader.loadLatest()
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        pathfinder.delegate = self
        pathfinder.connect()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}

extension FeedViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var items: [ListDiffable] = [wxScanner.currentWeather]
        items += loader.entries as [ListDiffable]
        items += pathfinder.messages as [ListDiffable]

        return items.sorted(by: { (left: Any, right: Any) -> Bool in
            if let left = left as? DateSortable, let right = right as? DateSortable {
                return left.date > right.date
            }
            return false
        })
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is Message {
            return MessageSectionController()
        } else if object is Weather {
            return WeatherSectionController()
        } else {
            return JournalSectionController()
        }
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

extension FeedViewController: PathfinderDelegate {
    func pathfinderDidUpdateMessages(pathfinder: Pathfinder) {
        adapter.performUpdates(animated: true)
    }
}
