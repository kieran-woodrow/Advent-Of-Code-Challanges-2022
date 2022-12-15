import Foundation

if let file = Bundle.main.url(forResource: "input", withExtension: "txt") {
    
    let data = try String(contentsOf: file, encoding: String.Encoding.utf8 )
    
    let messageAsString = data.split(separator:"\n", omittingEmptySubsequences: true)
    
    var messageAsCharacters: [Character] = []
    
    messageAsString[0].map{messageAsCharacters.append($0)}
    
    var startOfPacketCharacters = Set<Character>()
    var startOfPacketMarker = 0
    
    for currentPosition in messageAsCharacters.startIndex..<messageAsCharacters.endIndex-13 {
        
        for letter in currentPosition...(currentPosition+13) {
            startOfPacketCharacters.insert(messageAsCharacters[letter])
        }
        
        if startOfPacketCharacters.count == 14 {
            startOfPacketMarker = currentPosition + 14
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

