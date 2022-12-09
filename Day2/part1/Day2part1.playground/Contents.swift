import Foundation

if let file = Bundle.main.url(forResource: "input", withExtension: "txt") {
    
    let data = try String(contentsOf: file, encoding: String.Encoding.utf8 )
    
    let results = data.split(separator:"\n", omittingEmptySubsequences: true)
    var shapeScore: Int = 0
    var gameOutcome: Int = 0
    var bestScore: Int = 0
    
    for game in results {
        
        switch game.last {
        case "X":
            shapeScore += 1
        case "Y":
            shapeScore += 2
        case "Z":
            shapeScore += 3
        default:
            shapeScore += 0
        }
        
        if (game.first == "A" && game.last == "X") || game.first == "B" && game.last == "Y" || game.first == "C" && game.last == "Z"  {
            gameOutcome += 3
        } else if ( (game.first == "A" && game.last == "Z") || (game.first == "B" && game.last == "X") || (game.first == "C" && game.last == "Y") ) {
            gameOutcome += 0
        } else {
            gameOutcome += 6
        }
    }
    
    bestScore = gameOutcome + shapeScore
    
    print("\n")
    print("Best possible score that we can accumulate according to the game plan is " + String(bestScore) + " points")
   
} else {
    print("Error finding file")
}
