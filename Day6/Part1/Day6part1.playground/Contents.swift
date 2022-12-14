import Foundation

if let file = Bundle.main.url(forResource: "input", withExtension: "txt") {
    
    let data = try String(contentsOf: file, encoding: String.Encoding.utf8 )
    
    let messageAsString = data.split(separator:"\n", omittingEmptySubsequences: true)
    
    var messageAsCharacters: [Character] = []
    
    messageAsString[0].map{messageAsCharacters.append($0)}
    
    var startOfPacketCharacters = Set<Character>()
    var startOfPacketMarker = 0
    
    for index in stride(from: messageAsCharacters.startIndex, to: messageAsCharacters.endIndex-3, by: 1 ){
        
        startOfPacketCharacters.insert(messageAsCharacters[index])
        startOfPacketCharacters.insert(messageAsCharacters[index + 1])
        startOfPacketCharacters.insert(messageAsCharacters[index + 2])
        startOfPacketCharacters.insert(messageAsCharacters[index + 3])
        
        if startOfPacketCharacters.count == 4 {
            startOfPacketMarker = index + 4
            break
        }
        
        startOfPacketCharacters.removeAll()
    }
    
    print("\n")
    print("The first marker appears after character " + String(startOfPacketMarker) + " and has the packet " +
          String(startOfPacketCharacters) + " (in no particular order)")
    
} else {
    print("Error finding file")
}



