//
//  TimeCounter.swift
//  RGBullsEye
//
//  Created by Hussein Dimessi on 8/7/2021.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()
    var timer: Timer?
    private(set) var counter = 0
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateCounter),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc private func updateCounter() {
        counter += 1
        objectWillChange.send(self)
    }
    
    func killTimer() {
        timer?.invalidate()
        timer = nil
    }
}
