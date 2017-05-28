//
//  SegueInfo.swift
//  smartAlarm
//
//  Created by Damir Kazbekov on 4/29/17.
//  Copyright © 2017 damirkazbekov. All rights reserved.
//

import Foundation

struct SegueInfo {
    var curCellIndex: Int
    var isEditMode: Bool
    var label: String
    var mediaLabel: String
    var mediaID: String
    var repeatWeekdays: [Int]
    var enabled: Bool
    var snoozeEnabled: Bool
}
