//
//  UIImage+Extension.swift
//  SwiftUI Core Data
//
//  Created by Dmitry Novosyolov on 05/09/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import UIKit

extension UIImage {
    var toJpegCompressedData: Data? {
        return jpegData(compressionQuality: 0.0)
    }
}
