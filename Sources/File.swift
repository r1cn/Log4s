internal class File {
    internal let dateFormatter = DateFormatter()
    
    internal init() {
        dateFormatter.dateFormat = "YYYY-MM-dd"
    }
    
    internal func write(_ message: String, to directoryPath: String) {
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: directoryPath) {
            do {
                try fileManager.createDirectory(atPath: directoryPath, withIntermediateDirectories: true, attributes: [:])
            } catch {}
        }
        
        let fileName = dateFormatter.string(from: Date()) + ".txt"
        let filePath = directoryPath + "/\(fileName)"
        
        
        if let handle = FileHandle(forReadingAtPath: filePath), let oldLog = String(data: handle.readDataToEndOfFile(), encoding: .utf8) {
            
            do {
                try "\(oldLog)\n\(message)".write(toFile: filePath, atomically: true, encoding: .utf8)

            } catch {}
            
        } else {
            
            fileManager.createFile(atPath: filePath, contents: message.data(using: .utf8))
        }
    }
}


