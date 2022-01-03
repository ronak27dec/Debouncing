//
//  DebouncerTest.swift
//  DebouncingTests
//
//  Created by Ronak on 31/12/21.
//  Copyright © 2021 ronak. All rights reserved.
//

import XCTest
@testable import Debouncing

class DebouncerTest: XCTestCase {

    var sut: Debouncer!

    override func setUp() {
        super.setUp()
        sut = Debouncer(delay: 0.1, callback: someWebServiceCall)
    }

    func testCall() {
        sut.call()

        XCTAssertTrue(sut.timer != nil)
    }

    func someWebServiceCall() {

    }
}
