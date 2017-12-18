//
//  Tests.swift
//  Tests
//
//  Created by wzxjiang on 13/12/2017.
//  Copyright © 2017 wzxjiang. All rights reserved.
//

import XCTest
@testable import Log4s

class Tests: XCTestCase {
    
    override func setUp() {
        Log4s.start()
    }
    
    func testLog() {
        Log4s.log("hello world", .debug)
        
        Log4s.log("i will write this log to file", .info)
        
        Log4s.log("i will write this warning log to file", .warning)
        
        Log4s.log("i will write this error log to file", .error)
    }
    
    func testLogFile() {
        
        guard let directoryPath = Log4s.shared?.config.directoryPath else {
            XCTAssert(false)
            return
        }
        
        let fileManager = FileManager.default
        
        XCTAssert(fileManager.fileExists(atPath: directoryPath) == true)
    }
}
