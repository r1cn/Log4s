public typealias Format = (_ message: String, _ file: StaticString, _ function: StaticString, _ line: Int) -> String

internal let defaultFormat: Format = { (message, file, function, line) -> String in
    return "[Log4s] \(file)-\(function)-\(line): \(message)"
}
