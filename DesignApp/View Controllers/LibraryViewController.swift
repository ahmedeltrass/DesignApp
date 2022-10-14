//
//  LibraryViewController.swift
//  DesignApp
//
//  Created by Ahmed Eltrass on 03/10/2022.
//

import UIKit
import Combine
import SwiftUI
class LibraryViewController: UIViewController {
  
    @IBOutlet weak var cerificateLabel : UILabel!
    @IBOutlet weak var titleLabel : UILabel!
    
    @IBOutlet weak var topicTablelView: UITableView!
    @IBOutlet weak var sectionsCollectionView: UICollectionView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    private  var tokens :Set<AnyCancellable> = []
    override func viewDidLoad() {
        super.viewDidLoad()

        sectionsCollectionView.delegate = self
        sectionsCollectionView.dataSource = self
        sectionsCollectionView.layer.masksToBounds = false
        
        topicTablelView.delegate = self
        topicTablelView.dataSource = self
        topicTablelView.layer.masksToBounds = false
        topicTablelView.publisher(for: \.contentSize)
            .sink { newContentSize in
                self.tableViewHeight.constant = newContentSize.height
            }
            .store(in: &tokens)
    }
    
    @IBSegueAction func createCertificateView(_ coder: NSCoder) -> UIViewController? {
        let v = UIHostingController(coder: coder, rootView: CertificateView())
        v?.view.backgroundColor = .clear
        return v
    }
    
}
extension LibraryViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return  sections.count
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionCell", for: indexPath) as!  SectionsCollectionViewCell
        let section = sections[indexPath.item]
        cell.titleLabel.text = section.sectionTitle
        cell.SubtitleLabel.text = section.sectionSubtitle
        cell.logo.image = section.sectionIcon
        cell.bunner.image = section.sectionBunner
        return cell
        }
    }
    
extension LibraryViewController : UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return librarySitting.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath) as! TopicsTableViewCell
        let topic = librarySitting[indexPath.row]
            
        
        cell.topicLabel.text = topic.topicLabel
        cell.topicIcon.image = UIImage(systemName: topic.topicIcon)
     return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



