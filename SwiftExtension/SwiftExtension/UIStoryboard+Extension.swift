//
//  UIStoryboard+Extension.swift
//  SwiftExtension
//
//  Created by Diep Nguyen on 4/17/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

extension UIStoryboard {
    
    public static func loadViewControler(_ nameStoryBoard: String, nameController: String) -> UIViewController? {
        let storyboard = UIStoryboard(name: nameStoryBoard, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: nameController)
        return controller
    }
}
