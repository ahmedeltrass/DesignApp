//
//   Course.swift
//  DesignApp
//
//  Created by Ahmed Eltrass on 14/09/2022.
//

import UIKit
 
class Course{
    var courseTitle :String
    var courseSubtitle :String
    var courseDescription:String
    var courseIcon:UIImage
    var courseBunner:UIImage
    var couresAuther:[String]?
    var courseGradient:[CGColor]?
    var courseBackground:UIImage?
    var  sections :[Section]?
    
    init(title:String!,subtitle:String!,description:String!,icon:UIImage!,bunner:UIImage!,auther:[String]!,gradient:[CGColor]? = nil,background:UIImage? = nil, sections: [Section]
    )
    {
        self.courseTitle = title
        self.courseSubtitle = subtitle
        self.courseDescription = description
        self.courseIcon = icon
        self.courseBunner = bunner
        self.couresAuther = auther
        self.courseGradient = gradient
        self.courseBackground = background
        self.sections = sections
        
    }
    
    
}
let handBooks = [
    Course(title: "SwiftUI Handbook", subtitle: "80 sections - 9 hours", description: "Built an iOS app For  iOS 15 with custem  layouts, animations, and more", icon: UIImage(named: "Logo SwiftUI"), bunner: UIImage(named: "Illustration 2"), auther: ["Meng To"], gradient: [
        UIColor(red: 0.387, green: 0.041, blue: 0.55, alpha: 1.0).cgColor,
        UIColor(red: 0.215, green: 0.555, blue: 0.835, alpha: 1.0).cgColor], sections:sections  ),
    
    Course(title: "React Hooks Handbook", subtitle: "30 sections - 3 hours", description: " A comprehensive series of tutorials on React Hook  and more!", icon: UIImage(named: "Logo React"), bunner: UIImage(named: "Illustration 4"), auther: ["Meng To , Stephanie Diep"], gradient: [
        UIColor(red: 0.51, green: 0.255, blue: 0.737, alpha: 1.0).cgColor,
        UIColor(red: 0.883, green: 0.283, blue: 0.523, alpha: 1.0).cgColor,
        UIColor(red: 0.984, green: 0.647, blue: 0.545, alpha: 1.0).cgColor],sections: sections )
]
let courses = [
    Course(title: "SwiftUI Concurrency", subtitle: "NEW VIDEO", description: "Built an iOS app For  iOS 15 with custem  layouts, animations, and more", icon: UIImage(named: "Logo SwiftUI"), bunner: UIImage(named: "Illustration 4"), auther: ["Meng To"],background: UIImage(named: "Background 3"), sections: sections),
    
    Course(title: "Flutter for Designers", subtitle: "20 sections - 3 hours", description: " A comprehensive series of tutorials on React Hook  and more!", icon: UIImage(named: "Logo Flutter"), bunner: UIImage(named: "Illustration 1"), auther: ["Sai kambapati"],background: UIImage(named: "Background 4"), sections: sections),
    Course(title: "React Hooks Advanced", subtitle: "20 sections - 3 hours", description: " A comprehensive series of tutorials on React Hook  and more!", icon: UIImage(named: "Logo React"), bunner: UIImage(named: "Illustration 2"), auther: ["Sai kambapati"],background: UIImage(named: "Background 5"), sections: sections)
]
