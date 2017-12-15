internal func defaultPath() -> String {
    guard let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
        assert(true, "[Log4s]: defaultPath == nil'")
        return ""
    }
    return documentDirectory + "/Log4s"
}

public struct Config {
    let directoryPath: String
    let format: Format
    
    public init(directoryPath: String? = nil, format: Format? = nil) {
        self.directoryPath = directoryPath ?? Config.default.directoryPath
        self.format = format ?? Config.default.format
    }
    
    internal init(directoryPath: String, format: @escaping Format) {
        self.directoryPath = directoryPath
        self.format = format
    }
    
    static let `default` = Config(directoryPath: defaultPath(), format: defaultFormat)
}
