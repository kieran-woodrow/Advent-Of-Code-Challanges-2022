import Foundation

if let file = Bundle.main.url(forResource: "input", withExtension: "txt") {
    
    let data = try String(contentsOf: file, encoding: String.Encoding.utf8 )
    
    var allElfSections = data.components(separatedBy: CharacterSet(charactersIn: ",\n"))
    allElfSections.removeLast()
    
    var overlappingPairs = 0
    
    for index in stride(from: allElfSections.startIndex, to: allElfSections.endIndex - 1, by: 2) {
        if let elfOneSectionStart = allElfSections[index].split(separator: "-").first,
           let elfOneSectionEnd = allElfSections[index].split(separator: "-").last,
           let elfTwoSectionStart = allElfSections[index + 1].split(separator: "-").first,
           let elfTwoSectionEnd = allElfSections[index + 1].split(separator: "-").last
    {
            var elfOneSection = Set<Int>( (Int(elfOneSectionStart) ?? -1)...(Int(elfOneSectionEnd) ?? -1) )
            var elfTwoSection = Set<Int>( (Int(elfTwoSectionStart) ?? -1)...(Int(elfTwoSectionEnd) ?? -1) )
            
            if elfOneSection.isSubset(of: elfTwoSection) || elfTwoSection.isSubset(of: elfOneSection) {
                overlappingPairs += 1
            }
        }
    }
    
    print("\n")
    print("The amount of overlapping sections between all pairs of elves is: " + String(overlappingPairs))
    
} else {
    print("Error finding file")
}



