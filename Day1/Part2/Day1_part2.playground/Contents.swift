import Foundation

if let file = Bundle.main.url(forResource: "input", withExtension: "txt") {
    
    let data = try String(contentsOf: file, encoding: String.Encoding.utf8 )
    
    let elfCalories = data.split(separator:"\n", omittingEmptySubsequences: false)
    
    var elvesTotalCalories: [Int] = []
    var calorieTally: Int = 0
    
    for calorie in elfCalories {
        
        if calorie != "" {
            
            var intCalorie = Int(calorie)
            calorieTally += intCalorie ?? 0
            
            if calorie == elfCalories.last {
                elvesTotalCalories.append(calorieTally)
            }
            
        } else {
            elvesTotalCalories.append(calorieTally)
            calorieTally = 0
        }
    }
    
    var elvesTotalCaloriesAscending = elvesTotalCalories.sorted()
    
    var highestThree = elvesTotalCaloriesAscending.suffix(3)
    
    var total = 0
    
    for number in highestThree {
        total += number
    }
    
    var highestCalories: String = String(total)
    
    print("The top 3 elves had a total of " + highestCalories + " calories")
    print("\n")
    
} else {
    print("Error finding file")
}

