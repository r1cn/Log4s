import Foundation

public enum Level: Int {
    case debug = 0  // just print to console, not write to log file
    case info       // print to console & write to log file
    case warning    // warning message, print to console & write to log file
    case error      // error message, print to console & write to log file
    
    static func >(lhs: Level, rhs: Level) -> Bool {
        return lhs.rawValue > rhs.rawValue
    }
}

public class Log4s {
    internal static var shared: Log4s?
    
    internal var enable: Bool = false
    
    internal let config: Config
    
    @discardableResult
    public class func start(_ config: Config? = nil) -> Log4s {
        let logger = Log4s(config: config)
        
        logger.enable = true
        
        Log4s.shared = logger
        
        return logger
    }
    
    internal init(config: Config?) {
        self.config = config ?? Config.default
    }
    
    public class func log(_ message: String,
                   _ level: Level = .debug,
                   file: StaticString = #file,
                   function: StaticString = #function,
                   line: Int = #line) {
        Log4s.shared?.log(message, level, file: file, function: function, line: line)
    }
    
    internal func log(_ message: String,
             _ level: Level = .debug,
             file: StaticString = #file,
             function: StaticString = #function,
             line: Int = #line) {
        
        let logMessage = config.format(message, level, file, function, line)
#if DEBUG
        print(logMessage)
#endif
        if level > Level.debug {
            File().write(message, to: config.directoryPath)
        }
    }
}

