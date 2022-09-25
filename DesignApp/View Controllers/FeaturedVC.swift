//
//  ViewController.swift
//  DesignApp
//
//  Created by Ahmed Eltrass on 11/09/2022.
//

import UIKit
import Combine
class FeaturedVC: UIViewController {
    
    @IBOutlet weak var cardView: CustomView!
    
    @IBOutlet weak var blurView: CustomBlurView!
    
    @IBOutlet weak var handBookCollections: UICollectionView!
    
    @IBOutlet weak var coursesTableView: UITableView!
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var scrollView: UIScrollView!
    private  var tokens :Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handBookCollections.delegate = self
        handBookCollections.dataSource = self
        handBookCollections.layer.masksToBounds = false
        coursesTableView.delegate = self
        coursesTableView.dataSource = self
        coursesTableView.layer.masksToBounds = false
       
        coursesTableView.publisher(for: \.contentSize)
            .sink { newContentSize in
                self.tableViewHeight.constant = newContentSize.height
            } 
            .store(in: &tokens)
        scrollView.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsVC = segue.destination as? CourseViewController ,let course = sender as? Course{
            detailsVC.course = course
            
        }
    }

 
}
extension FeaturedVC : UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return handBooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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

extension FeaturedVC:UITableViewDelegate,UITableViewDataSource{
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesTableCell", for: indexPath) as! CoursesTableViewCell
        let course = courses[indexPath.section]
        cell.courseBunner.image = course.courseBunner
        cell.courseBackground.image = course.courseBackground
        cell.courseTitle.text = course.courseTitle
        cell.courseLogo.image = course.courseIcon
        cell.courseSubtitle.text = course.courseSubtitle
        cell.courseDescription.text = course.courseDescription
       return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if  (section == 0){
            return 0
        }
        return 20
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selctedCourse = courses[indexPath.section]
        performSegue(withIdentifier: "coursePressed", sender: selctedCourse)
    }
    
}
extension FeaturedVC : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentSize = scrollView.contentSize.height
        let lastScroolPos = scrollView.contentOffset.y
        let precentage = lastScroolPos / contentSize
        if precentage <= 0.15{
            self.title = "Featured"
        } else if precentage <= 0.33{
            self.title = "HandBooks"
        }
        else {
            self.title = "Courses"
        }


    }
}
