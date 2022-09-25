//
//  CourseViewController.swift
//  DesignApp
//
//  Created by Ahmed Eltrass on 15/09/2022.
//

import UIKit
import Combine

class CourseViewController: UIViewController {
    var course :Course?
    @IBOutlet weak var descriptionlabel : UILabel!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var subtitelLabel : UILabel!
    @IBOutlet weak var autherLabel: UILabel!

    @IBOutlet weak var imageIconview: CustomImageView!
    @IBOutlet weak var bannerImage : UIImageView!
    @IBOutlet weak var backgroundImage : UIImageView!
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    private  var tokens :Set<AnyCancellable> = []
    
    @IBOutlet weak var goBack: UIButton!
    @IBOutlet weak var sectionTableView: UITableView!
    @IBOutlet weak var menuButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        sectionTableView.delegate = self
        sectionTableView.dataSource = self
        
        sectionTableView.publisher(for: \.contentSize)
            .sink { newContentSize in
                self.tableViewHeight.constant = newContentSize.height
            }
            .store(in: &tokens)
        
        
        goBack.layer.cornerRadius = 10
        goBack.layer.cornerCurve = .continuous
        goBack.clipsToBounds = true
        
        self.imageIconview.image = course?.courseIcon
        self.bannerImage.image = course?.courseBunner
        self.backgroundImage.image = course?.courseBackground
        self.titleLabel.text = course?.courseTitle
        self.subtitelLabel.text = course?.courseSubtitle
        self.descriptionlabel.text = course?.courseDescription
        self.autherLabel.text = " Taught By \(course?.couresAuther?.formatted(.list(type: .and, width: .standard)) ?? "Design+Code")"
        
        let menu = UIMenu(title: "Course Option",
                   options: .displayInline,
                   children: [
                    UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up"),  handler: { _ in
                            // Share Course
                    }),
                    UIAction(title: "Take Test", image: UIImage(systemName: "highlighter"),  handler: { _ in
                            // Take Test
                    }),
                    UIAction(title: "Download", image: UIImage(systemName: "square.and.arrow.down"),  handler: { _ in
                            // Share Course
                    }),
                    UIAction(title: "Forums", image: UIImage(systemName: "chevron.left.forwardslash.chevron.right"),  handler: { _ in
                            // Share Course
                    })
        ])
        menuButton.showsMenuAsPrimaryAction = true
        menuButton.menu = menu
    }
    
    
    

    @IBAction func goBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
extension CourseViewController :UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.course?.sections?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell", for: indexPath) as!  SectionTableViewCell
        if let selectedCourse = course {
            let selectedSection = selectedCourse.sections![indexPath.row]
            cell.courseDescription.text = selectedSection.sectionDescription
            cell.courseLogo.image = selectedSection.sectionIcon
            cell.courseSubtitle.text = selectedSection.sectionSubtitle
            cell.courseTitle.text = selectedSection.sectionTitle
        }
     return cell

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath , animated: true)
    }
   
}
