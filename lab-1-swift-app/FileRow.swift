import SwiftUI

struct FileRow: View {
    var textFile: TextFile
    
    var body: some View {
        Text(textFile.Name)
    }
}

struct FileRow_Previews: PreviewProvider {
    static var previews: some View {
        FileRow(textFile: textFiles[1])
    }
}
