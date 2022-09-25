//
//  ExploreViewController.swift
//  DesignApp
//
//  Created by Ahmed Eltrass on 24/09/2022.
//

import UIKit
import Combine
class ExploreViewController: UIViewController {

    @IBOutlet weak var topicTablelView: UITableView!
    @IBOutlet weak var sectionsCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    private  var tokens :Set<AnyCancellable> = []
    override func viewDidLoad() {
        super.viewDidLoad()

        sectionsCollectionView.delegate = self
        sectionsCollectionView.dataSource = self
        sectionsCollectionView.layer.masksToBounds = false
        
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        popularCollectionView.layer.masksToBounds = false
        
        
        topicTablelView.delegate = self
        topicTablelView.dataSource = self
        topicTablelView.layer.masksToBounds = false
        topicTablelView.publisher(for: \.contentSize)
            .sink { newContentSize in
                self.tableViewHeight.constant = newContentSize.height
            }
            .store(in: &tokens)
    }

}
extension ExploreViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sectionsCollectionView
        {
            return  sections.count
        }else{
        return  handBooks.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sectionsCollectionView{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionCell", for: indexPath) as!  SectionsCollectionViewCell
        let section = sections[indexPath.item]
        cell.titleLabel.text = section.sectionTitle
        cell.SubtitleLabel.text = section.sectionSubtitle
        cell.logo.image = section.sectionIcon
        cell.bunner.image = section.sectionBunner
        return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath) as! HandBookCollectionViewCell
            let handBook = handBooks[indexPath.item]
            cell.titleLabel.text = handBook.courseTitle
            cell.SubtitleLabel.text = handBook.courseSubtitle
            cell.descriptionLabel.text = handBook.courseDescription
            cell.gredient.colors = handBook.courseGradient
            cell.logo.image = handBook.courseIcon
            cell.bunner.image = handBook.courseBunner
            return cell
        }
        }
    }
    
extension ExploreViewController : UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath) as! TopicsTableViewCell
        let topic = topics[indexPath.row]
            
        
        cell.topicLabel.text = topic.topicLabel
        cell.topicIcon.image = UIImage(systemName: topic.topicIcon)
     return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
