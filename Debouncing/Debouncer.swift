//
//  Debouncer.swift
//  Debouncing
//
//  Created by Ronak on 03/01/21.
//  Copyright © 2021 ronak. All rights reserved.
//

import Foundation

class Debouncer : NSObject {

    var callback: (() -> Void)
    var delay: Double
    weak var timer: Timer?

    init(delay: Double, callback: @escaping (() -> Void)) {
        self.delay = delay
        self.callback = callback
    }

    func call() {
        timer?.invalidate()
        let nextTimer = Timer.scheduledTimer(timeInterval: delay,
                                             target: self,
                                             selector: #selector(fire),
                                             userInfo: nil,
                                             repeats: false)
        timer = nextTimer
    }

    @objc func fire() {
        print("fire is called")
        self.callback()
    }
}
