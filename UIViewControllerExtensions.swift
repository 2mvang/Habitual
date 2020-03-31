//
//  UIViewControllerExtensions.swift
//  Habitual
//
//  Created by Marissa Vang on 3/24/20.
//  Copyright © 2020 Marissa Vang. All rights reserved.
//

import UIKit

extension UIViewController {
  static func instantiate() -> Self {
    return self.init(nibName: String(describing: self), bundle: nil)
  }
}
