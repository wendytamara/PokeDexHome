//
//  FileHelper.swift
//  Home
//
//  Created by Wendy Tamara Quispe Quispe on 19/12/23.
//

class FileHelper {
    
    static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    static func writeDataToImageFile(data: Data, fileName: String) throws {
        try data.write(to: self.getDocumentsDirectory().appendingPathComponent(fileName))
    }
    
    static func readImageFromFile(fileName: String) throws -> UIImage? {
        let fileURL = self.getDocumentsDirectory().appendingPathComponent(fileName)
        let imageData = try Data(contentsOf: fileURL)
        return UIImage(data: imageData)
    }
    static func fileExistsInCache(fileName: String) -> Bool {
        let fileURL = self.getDocumentsDirectory().appendingPathComponent(fileName)
        return FileManager.default.fileExists(atPath: fileURL.path)
    }
    
}
