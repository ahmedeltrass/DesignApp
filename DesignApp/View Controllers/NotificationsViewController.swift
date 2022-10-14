//
//  NotificationsViewController.swift
//  DesignApp
//
//  Created by Ahmed Eltrass on 04/10/2022.
//

import UIKit
import Combine
class NotificationsViewController: UIViewController {
    
    @IBOutlet weak var cardView: CustomView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource : UITableViewDiffableDataSource<TBSection , NotificationModel>! = nil
    var currentSnapshot : NSDiffableDataSourceSnapshot<TBSection, NotificationModel>! = nil
    
    private  var tokens :Set<AnyCancellable> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.publisher(for: \.contentSize)
            .sink { newContentSize in
                self.tableViewHeight.constant = newContentSize.height + 10
            }
            .store(in: &tokens)
        
        tableView.delegate = self
        
        self.dataSource = UITableViewDiffableDataSource<TBSection , NotificationModel>(tableView: tableView){
            (tableView : UITableView , indexPath : IndexPath , item : NotificationModel) -> NotificationsTableViewCell in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NotifictionTableViewCell", for: indexPath) as? NotificationsTableViewCell else {
                fatalError("error")
            }
            
            cell.titleLabel.text = item.title
            cell.massageLabel.text = item.massage
            cell.SubtitleLabel.text = item.subtitle
            cell.notificationImageView.image = UIImage(named: item.image)
            return cell
        }
        self.dataSource.defaultRowAnimation = .fade
        loudData()
    }
    func loudData(){
        currentSnapshot = NSDiffableDataSourceSnapshot<TBSection , NotificationModel>()
        currentSnapshot.appendSections([.main])
        self.currentSnapshot.appendItems(sampleNotifs, toSection: .main )
        self.dataSource.apply(currentSnapshot, animatingDifferences: true)
    }

}
extension NotificationsViewController :UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
