import Foundation


var textFiles: [TextFile] = initTextFiles()

func getFileNames() -> [String]  {

    do {
        let documentDirectory = try FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        )
        
        let directoryContents = try FileManager.default.contentsOfDirectory(
            at: documentDirectory,
            includingPropertiesForKeys: nil
        )
        
        let fileNames: [String] = directoryContents.map { $0.lastPathComponent}
        
        return fileNames.sorted()
    } catch {
        print(error)
    }
    return ["No url provided"]
}

func initTextFiles() -> [TextFile] {

    let fileNames = getFileNames()
    var textFiles:[TextFile] = []
    
    for fileName in fileNames {
        textFiles.append(TextFile(Name: fileName, Content: GetFileContent(selectedFile: fileName)))
    }
    return textFiles
}

func GetFileContent(selectedFile: String) -> String {
    let file = selectedFile

    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

        let fileURL = dir.appendingPathComponent(file)

        do {
            let text2 = try String(contentsOf: fileURL, encoding: .utf8)
            return text2
        }
        catch {return ""}
    }
    return "Could not find file content"
}

func WriteToFile(selectedFile: String, text: String) -> Void {
    let index = textFiles.firstIndex {$0.Name == selectedFile}!
    let file = textFiles[index]
    
    
    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        
        let fileURL = dir.appendingPathComponent(file.Name)
        
        let dateOfCreation = GetFileAttributes(path: fileURL.path)

        var content = GetFileContent(selectedFile: file.Name)

        switch (text) {
        case "Full path":
            content += "\n" + fileURL.path
            break
        case "Date created":
            content += "\n" + "\(dateOfCreation?[FileAttributeKey.creationDate] ?? "")"
        default:
            content += "\n" + "\(dateOfCreation?[FileAttributeKey.size] ?? "")" + " bytes"
            break
        }
             
        print(textFiles[index])// = content
        
        do {
            try content.write(to: fileURL, atomically: false, encoding: .utf8)
        }
        catch {return}
    }
}

func GetFileAttributes(path: String) -> [FileAttributeKey: Any]? {
    do {
        let attr = try FileManager.default.attributesOfItem(atPath: path)
        return attr
    } catch {
        return nil
    }
}
