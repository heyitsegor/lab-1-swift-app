import SwiftUI

struct FileContent: View {
    @State public var textFile: TextFile
    
    var body: some View {
        VStack{
            Text(textFile.Content /*+ "\n" + textContent*/)
                .onAppear {
                    textFile.Content = GetFileContent(selectedFile: textFile.Name)
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .topLeading)
            HStack{
                Button("Write smthng 1") {
                    WriteToFile(selectedFile: textFile.Name, text: "Someting 1")
                    textFile.Content = GetFileContent(selectedFile: textFile.Name)
                }
                
                Button("Write date of creation") {
                    WriteToFile(selectedFile: textFile.Name, text: "Date created")
                    textFile.Content = GetFileContent(selectedFile: textFile.Name)
                }
                
                Button("Write URL") {
                    WriteToFile(selectedFile: textFile.Name, text: "Full path")
                    textFile.Content = GetFileContent(selectedFile: textFile.Name)
                }
            }
            .frame(maxWidth:.infinity,maxHeight: 20, alignment: .bottomTrailing)
        }
        .padding(20)
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

//struct FileContent_Previews: PreviewProvider {
//    static var previews: some View {
//        FileContent(textFile: textFiles[1])
//    }
//}
