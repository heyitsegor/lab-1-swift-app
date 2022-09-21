import SwiftUI

struct FileList: View {
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationView {
            List(textFiles, id: \.self) { textFile in
                NavigationLink {
                    FileContent(textFile: textFile)
//                        .onAppear {
//                            textFiles = initTextFiles()
//                        }
                } label: {
                    FileRow(textFile: textFile)
                }
            }
            .navigationTitle("Files")
            .searchable(
                text: $searchText
            )
        }
    }
}

struct FileList_Previews: PreviewProvider {
    static var previews: some View {
        FileList()
    }
}
