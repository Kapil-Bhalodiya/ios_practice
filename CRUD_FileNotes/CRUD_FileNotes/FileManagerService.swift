


import Foundation
class FileMangerService {
    
    static func getDocDir() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print("Doc Dir: \(paths[0])")
        return paths[0]
    }
    
    static func getFIles() -> Array<String>{
        let fm = FileManager.default
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        var files = [String]()
        do{
            let items = try fm.contentsOfDirectory(atPath: path.path)
            for item in items {
                if item.contains(".txt"){
                    files.append(item.components(separatedBy: ".").first ?? "")
                }
            }
        }catch{
            
        }
        return files
    }
}

