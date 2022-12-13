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
            switch game.first {
            case "A":
                shapeScore += 3
            case "B":
                shapeScore += 1
            case "C":
                shapeScore += 2
            default:
                shapeScore += 0
            }
            gameOutcome += 0
            
        case "Y":
            switch game.first {
            case "A":
                shapeScore += 1
            case "B":
                shapeScore += 2
            case "C":
                shapeScore += 3
            default:
                shapeScore += 0
            }
            gameOutcome += 3
            
        case "Z":
            switch game.first {
            case "A":
                shapeScore += 2
            case "B":
                shapeScore += 3
            case "C":
                shapeScore += 1
            default:
                shapeScore += 0
            }
            gameOutcome += 6
            
        default:
            shapeScore += 0
            gameOutcome += 0
        }
        print("Shape score is " + String(shapeScore))
        print("Game score is " + String(gameOutcome))
        bestScore = gameOutcome + shapeScore
    }
    
    bestScore = gameOutcome + shapeScore
    
    print("\n")
    print("Best possible score that we can accumulate according to the game plan is " + String(bestScore) + " points")
   
} else {
    print("Error finding file")
}
