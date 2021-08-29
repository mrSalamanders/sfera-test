//
//  TimerModel.swift
//  sfera-test
//
//  Created by Владислав Николаев on 29.08.2021.
//

import Foundation
/**
 Модель для таймера, содержащая всё необходимое
 */
class TimerModel {
    static func == (lhs: TimerModel, rhs: TimerModel) -> Bool {
        if (lhs.title == rhs.title) {
            return true
        } else {
            return false
        }
    }
    var title : String?
    var seconds : Int?
    var timer : Timer?
}
