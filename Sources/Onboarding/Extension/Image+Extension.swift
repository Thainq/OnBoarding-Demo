//
//  Image+Extension.swift
//  Generic-Networking-Swift
//
//  Created by Thai Nguyen Quang on 11/22/23.
//

import Foundation
import SwiftUI

public extension Image {

    static var bird: Image {
        Image("creature-bird-blue-fly", bundle: .module)
    }

    static var catPurple: Image {
        Image("creature-cat-purple-cute", bundle: .module)
    }

    static var catPurr: Image {
        Image("creature-cat-purr", bundle: .module)
    }

    static var chameleon: Image {
        Image("creature-chameleon", bundle: .module)
    }

    static var dogBoneStand: Image {
        Image("creature-dog-and-bone", bundle: .module)
    }

    static var dogBone: Image {
        Image("creature-dog-bone", bundle: .module)
    }

    static var dogTennisBall: Image {
        Image("creature-dog-tennis-ball", bundle: .module)
    }
}
