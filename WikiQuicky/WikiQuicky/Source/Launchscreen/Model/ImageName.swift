//
//  ImageName.swift
//  WikiQuicky
//
//  Created by Mukhammadjon Askarov on 14/04/21.
//

import UIKit

enum ImageName: String {
    case
        page1,
        page2,
        page3,
        page4,
        page5
        
    var image: UIImage {
        guard let image = UIImage(named: rawValue) else {
            return UIImage(named: "page4")!
        }
        return image
    }
}
