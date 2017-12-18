public typealias Format = (_ message: String, _ level: Level, _ file: StaticString, _ function: StaticString, _ line: Int) -> String

internal let defaultFormat: Format = { (message, level, file, function, line) -> String in
    switch level {
    case .debug: fallthrough
    case .info:
        return """
        ->
        [Log4s]
        file: \(file):line\(line):\(function)
            \(message)
        <-
        """
    case .warning:
        return """
        ->
        [Log4s] ⚠️⚠️⚠️
        file: \(file):line\(line):\(function)
            \(message)
        <-
        """
    case .error:
        return """
        ->
        [Log4s] ❌❌❌
        file: \(file):line\(line):\(function)
            \(message)
        <-
        """
    }
}
