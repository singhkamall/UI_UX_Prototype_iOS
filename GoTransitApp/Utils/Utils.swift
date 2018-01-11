//
//  Utils.swift
//  GoTransitApp
//
//  Created by Robert Argume on 2018-01-10.
//  Copyright © 2018 GoTransit. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class Utils {
    // This function convert a RGB component to standarized CG value
    public static func rgbHexaComponentToDecimal(_ hexa:String) -> CGFloat{
        if let decimal = UInt8(hexa, radix: 16) {
            return CGFloat(decimal) / 255.0
        }
        return 0
    }
}

