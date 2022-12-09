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
    
    elvesTotalCalories.sort()
    
    var highestCalorie: String = String(elvesTotalCalories.popLast() ?? -1)
    
    print("The elf with the most calories had " + highestCalorie + " calories")
    print("\n")
    
} else {
    print("Error finding file")
}
