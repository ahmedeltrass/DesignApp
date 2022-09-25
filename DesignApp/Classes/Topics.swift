//
//  Topics.swift
//  DesignApp
//
//  Created by Ahmed Eltrass on 25/09/2022.
//

import UIKit
class Topics {
    var topicIcon :String
    var topicLabel :String
    
    init( name : String!, icon : String!){
    self.topicIcon = icon
    self.topicLabel = name
    }
    
}
let topics = [Topics(name: "iOS Developer" , icon: "iphone"),
              Topics(name: "UI Design " , icon: "eyedropper"),
              Topics(name: "Web Development" , icon: "desktopcomputer")]
