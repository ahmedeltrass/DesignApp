//
//  Section.swift
//  DesignApp
//
//  Created by Ahmed Eltrass on 17/09/2022.
//

import UIKit
class Section{
    var sectionTitle :String
    var sectionSubtitle :String
    var sectionDescription:String
    var sectionIcon:UIImage
    var sectionBunner:UIImage
   
     
    init(title:String!,subtitle:String!,description:String!,icon:UIImage!,bunner:UIImage!){
        self.sectionTitle = title
        self.sectionSubtitle = subtitle
        self.sectionDescription = description
        self.sectionIcon = icon
        self.sectionBunner = bunner
    }
    let sections = [
        Section(title: "Advanced Custom Layout", subtitle: "SwiftUI For iOS 15", description:"Built an iOS app For  iOS 15 with custem  layouts.", icon: UIImage(named: "Logo SwiftUI"), bunner: UIImage(named: "Illustration 4")),
        Section(title: "Coding The Home View", subtitle: "SwiftUI Concurrancy", description:"Learn about the formatted(date:time:)method and AsyncImage.", icon: UIImage(named: "Logo SwiftUI"), bunner: UIImage(named: "Illustration 4")),
        Section(title: "Advanced Custom Layout", subtitle: "SwiftUI For iOS 15", description:"Built an iOS app For  iOS 15 with custem  layouts.", icon: UIImage(named: "Logo Flutter"), bunner: UIImage(named: "Illustration 1"))
    ]
    
    
}
