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
    ["name": "Karl Saygan", "height": "42", "experience": "YES", "guardians" : "Heather Bledsoe"]
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

for num in 0..<expPerTeam {
    sharks.append(expPlayers[num])
    dragons.append(expPlayers[num+1])
    raptors.append(expPlayers[num+2])
}





// Bonus: Logic to ensure that each team's average height is within 1.5 inch of the others as well as having each team contain the same number of experienced players.




// Provide logic that prints a personalized letter to the guardians specifying: the player’s name, guardians' names, team name, and date/time of their first team practice. The letters should be visible when code is placed in a XCode Playground or run in an XCode project.




// Calculate average height overall
var htSum  = 0
for current in allPlayers {
    htSum += Int(allPlayers[0]["height"]!)!
}
var htAvg = htSum / allPlayers.count
