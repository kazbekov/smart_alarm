
//
//  Persistabel.swift
//  smartAlarm
//
//  Created by Damir Kazbekov on 4/29/17.
//  Copyright © 2017 damirkazbekov. All rights reserved.
//

import Foundation

protocol Persistable{
    var ud: UserDefaults {get}
    var persistKey : String {get}
    func persist()
    func unpersist()
}
