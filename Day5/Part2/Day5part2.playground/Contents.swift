import Foundation

if let file = Bundle.main.url(forResource: "input", withExtension: "txt") {
    
    let data = try String(contentsOf: file, encoding: String.Encoding.utf8 )
    
    var rawDataInAnArray = data.components(separatedBy: CharacterSet(charactersIn: "\n" ))
    rawDataInAnArray.removeLast()
    
    let initialStacksAndRules = rawDataInAnArray.split(separator: "")
    let rulesToFollow = initialStacksAndRules[1].split(separator: ",")
    
    let numberOfStacksToBeCreated = initialStacksAndRules[0].last?.last?.wholeNumberValue
    var initialStackSequence = initialStacksAndRules[0]
    
    var listOfAllStacks = [[Character]]()
    var finalCratesOnTopOfStacks = ""
    
    for _ in 0..<(numberOfStacksToBeCreated ?? -1) {
        listOfAllStacks.append([])
    }
    
    for stack in 0..<(initialStackSequence.count - 1 ) {
        for (index, letter) in initialStackSequence[stack].enumerated()  where (letter != "]" && letter != "[" && letter != " " ){
            var stackIndex = (index + 3) / 4
            listOfAllStacks[stackIndex - 1].insert(letter, at: 0)
        }
    }
    
    for rule in rulesToFollow[0].enumerated() {
        let ruleWithoutSpaces = rule.element.replacingOccurrences(of: " ", with: "")
        let numbersFromRuleWithWhitespaces = ruleWithoutSpaces.components(separatedBy: CharacterSet(charactersIn: "movefromto"))
        let numbersFromRule = numbersFromRuleWithWhitespaces.filter({ $0 != ""})
        
        let numberOfCratesToMove = Int(numbersFromRule[0]) ?? -1
        let fromCrate = Int(numbersFromRule[1]) ?? -1
        let toCrate = Int(numbersFromRule[2]) ?? -1
        
        for i in (0..<numberOfCratesToMove).reversed() {
            listOfAllStacks[toCrate - 1].append(listOfAllStacks[fromCrate - 1].remove(at: listOfAllStacks[fromCrate - 1].count - 1 - i))
        }
    }
    
    for crate in 0..<listOfAllStacks.count {
        var crateId = Character(extendedGraphemeClusterLiteral: listOfAllStacks[crate].last ?? Character(""))
        finalCratesOnTopOfStacks.append(crateId)
    }
    
    print("\n")
    print("The crates that end up lying on top of the stacks are: " + finalCratesOnTopOfStacks)
    
} else {
    print("Error finding file")
}

