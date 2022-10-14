//
//  Notification.swift
//  DesignApp
//
//  Created by Ahmed Eltrass on 14/10/2022.
//

import Foundation
import FirebaseFirestore
enum TBSection : CaseIterable{
    case main
}
struct NotificationModel :Hashable ,Codable {
    var id: String?
    var title : String!
    var massage : String!
    var subtitle: String!
    var image : String!
    var sendAt : Date!
    
}
let sampleNotifs = [
   
    NotificationModel(id:"0x1",title: "New Release", massage: "A new release  of the SwiftUI course has been released", subtitle: "SwiftUI", image: "Logo SwiftUI", sendAt: Date()),
    NotificationModel(id:"0x2",title: "Content Update", massage: "A new release  of the SwiftUI course has been released", subtitle: "React Hook", image: "React", sendAt: Date()),
    NotificationModel(id:"0x3",title: "New Release", massage: "A new release  of Sai     Kombampate course has been released", subtitle: "UIkit for iOS 15 ", image: "SwiftUI", sendAt: Date()),
    NotificationModel(id:"0x4",title: "Black Friday Deal", massage: "A new release  of the SwiftUI course has been released", subtitle: "Design+Code", image: "Design+Code", sendAt: Date())
]
