// Sarah Paetsch 4/15/16
// Soccer League Coordinator Project
// Treehouse iOS Techdegree

// Manually create a single collection that contains all information for all 18 players. Each player should themselves be represented by their own collection.

let allPlayers : [[ String:String ]] = [
    ["name": "Joe Smith", "height": "42", "experience": "YES", "guardians": "Jim and Jan Smith"],
    ["name": "Jill Tanner", "height": "36", "experience": "YES", "guardians" : "Clara Tanner"],
    ["name": "Bill Bon", "height": "43", "experience": "YES", "guardians" : "Sara and Jenny Bon"],
    ["name": "Eva Gordon", "height": "45", "experience": "NO", "guardians" : "Wendy and Mike Gordon"],
    ["name": "Matt Gill", "height": "40", "experience": "NO", "guardians" : "Charles and Sylvia Gill"],
    ["name": "Kimmy Stein", "height": "41", "experience": "NO", "guardians" : "Bill and Hillary Stein"],
    ["name": "Sammy Adams", "height": "45", "experience": "NO", "guardians" : "Jeff Adams"],
    ["name": "Karl Saygan", "height": "42", "experience": "YES", "guardians" : "Heather Bledsoe"],
    ["name": "Suzane Greenberg", "height": "44", "experience": "YES", "guardians" : "Henrietta Dumas"],
    ["name": "Sal Dali", "height": "41", "experience": "NO", "guardians" : "Gala Dali"],
    ["name": "Joe Kavalier", "height": "39", "experience": "NO", "guardians" : "Sam and Elaine Kavalier"],
    ["name": "Ben Finkelstein", "height": "44", "experience": "NO", "guardians" : "Aaron and Jill Finkelstein"],
    ["name": "Diego Soto", "height": "41", "experience": "YES", "guardians" : "Robin and Sarika Soto"],
    ["name": "Chloe Alaska", "height": "47", "experience": "NO", "guardians" : "David and Jamie Alaska"],
    ["name": "Arnold Willis", "height": "43", "experience": "NO", "guardians" : "Claire Willis"],
    ["name": "Phillip Helm", "height": "44", "experience": "YES", "guardians" : "Thomas Helm and Eva Jones"],
    ["name": "Les Clay", "height": "42", "experience": "YES", "guardians" : "Wynonna Brown"],
    ["name": "Herschel Krustofski", "height": "45", "experience": "YES", "guardians" : "Hyman and Rachel Krustofski"]
]


// Create appropriate variables and logic to sort and store players into three teams: Sharks, Dragons and Raptors. Be sure that your logic results in all teams having the same number of experienced players on each.

// Team arrays
var sharks : [[String:String]] = []
var dragons : [[String:String]] = []
var raptors : [[String:String]] = []
var expPlayers : [[String:String]] = []
var otherPlayers : [[String:String]] = []

for current in allPlayers {
    if (current["experience"] == "YES") {
        expPlayers.append(current)
    } else {
        otherPlayers.append(current)
    }
}

var expPerTeam = expPlayers.count / 3
var otherPerTeam = otherPlayers.count / 3

//for num in 0..<expPerTeam {
//    sharks.append(expPlayers[num])
//    dragons.append(expPlayers[num+1])
//    raptors.append(expPlayers[num+2])
//}
//for num in 0..<otherPerTeam {
//    sharks.append(otherPlayers[num])
//    dragons.append(otherPlayers[num+1])
//    raptors.append(otherPlayers[num+2])
//}

otherPlayers


func dividePlayers(origin: [[String:String]]) {
    var num = 0
    while num < origin.count {
        sharks.append(origin[num])
        dragons.append(origin[num+1])
        raptors.append(origin[num+2])
        num = num + 3
    }
}

dividePlayers(otherPlayers)
dividePlayers(expPlayers)


// Bonus: Logic to ensure that each team's average height is within 1.5 inch of the others as well as having each team contain the same number of experienced players.


func findAvgHeight(team: [[String:String]]) -> Double {
    var htSum  = 0.0
    for current in team {
        htSum += Double(current["height"]!)!
    }
    return htSum / Double(team.count)
}

var sharkAvg = findAvgHeight(sharks)
var raptorAvg = findAvgHeight(raptors)
var dragonAvg = findAvgHeight(dragons)

func checkHtAvg() -> Bool {

    if (abs(sharkAvg - raptorAvg) <= 1.5 && abs(raptorAvg - dragonAvg) <= 1.5 && abs(sharkAvg - dragonAvg) <= 1.5) {
        return true
    }
    return false
    
}
checkHtAvg()







// Provide logic that prints a personalized letter to the guardians specifying: the player’s name, guardians' names, team name, and date/time of their first team practice. The letters should be visible when code is placed in a XCode Playground or run in an XCode project.


func writeLetters(teamArr: [[String:String]], team: String, gameDate: String){
    for player in teamArr {
        let name = player["name"]!
        let guardians = player["guardians"]!
        
        print("Dear \(guardians) your kid is \(name). Assigned to \(team). First game on \(gameDate)")
    }
}


writeLetters(sharks, team: "Sharks", gameDate: "12/3/14")
writeLetters(raptors, team: "Raptors", gameDate: "1/5/16")



// Calculate average height overall
var htSum  = 0
for current in allPlayers {
    htSum += Int(allPlayers[0]["height"]!)!
}
var htAvg = htSum / allPlayers.count
