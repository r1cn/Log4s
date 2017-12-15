//
//  Tests.swift
//  Tests
//
//  Created by wzxjiang on 13/12/2017.
//  Copyright © 2017 wzxjiang. All rights reserved.
//

import XCTest
import Log4s

class Tests: XCTestCase {
    
    func testExample() {
        Log4s.start()
        
        Log4s.log("hello world", .debug)
        
        Log4s.log("i will write this log to file", .info)
        
        Log4s.log("i will write this warning log to file", .warning)
    }
    
    
}
